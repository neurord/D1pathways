#neurdh5_anal.py
#in python, type ARGS="subdir/fileroot,par1 par2,mol1 mol2,sstart ssend,rows" then execfile('neurordh5_analysis.py')
#DO NOT PUT ANY SPACES NEXT TO THE COMMAS, DO NOT USE TABS, rows is optional
#mol1 mol2, etc are the names of molecles to process
#par1 and optionally par2 are specifications of parameter variations, as follows:
#The filenames to read in are constructed as "subdir/fileroot"+"-"+par1+"*"-"+par2+"*"
#DO NOT use hyphens in filenames except for preceding parameter name
#if no parameters specified, then fileroot needs to be full filename (excluding the extension)
#e.g. ARGS="Ca GaqGTP,Ca GaqGTP Ip3,../Repo/plc/Model_PLCassay,15 20" time units are sec
#e.g. ARGS=",Ca GaqGTP IP3,plc/Model_PLCassay_Ca1"
#if mol ommitted, then all molecules processed.  if sstart ssend are ommitted, then calculates basal from 7.5-10% of runtime
#in the first set of parameters below, change outputavg from 0 to 1 to generate output files of region averages for plotting
#from outside python, type python neurordh5_analysis [par1 par2] [mol1 mol2]
#Assumes that molecule outputs are integers
#Can process multiple parameter variations, but all files must use same morphology, meshfile, and simulation time/sampling rate.
#Can process multiple trials for each parameter variation
#It will provide region averages (each spine, dendrite submembrane, cytosol)
#If only a single file, will plot multiple trials; if multiple trials, plots the mean over trials
#Future improvements:
#   spatial average along dendrite

from __future__ import print_function
from __future__ import division

import os
import numpy as np
from matplotlib import pyplot
from string import *
import sys  
import glob
import h5utils
import plot_h5 as pu5
import h5py as h5

#######################################################
#indicate the name of submembrane region for totaling molecules that are exclusively submembrane
#only relevant for tot_species calculation. this should be name of structure concatenated with sub
submembname='sub'
dend="dend"
spinehead="head"
#Spatial average (=1 to process) only includes the structure dend, and subdivides into bins:
spatialaverage=0
bins=10
#how much info to print
showss=0
show_inject=0
print_head_stats=0
#outputavg determines whether output files are written
outputavg=0
showplot=1  #2 indicates plot the head conc, 0 means no plots
stimspine='sa1[0]' #"name" of (stimulated) spine
calc_signature=0#1 means one overall signature, 2 mean separate spine and dend signature

#Example of how to total some molecule forms; turn off with tot_species={}
#No need to specify subspecies if uniquely determined by string
sub_species={"PI": ["Ip3","Ip3degrad","Ip3degPIk","Pip2","PlcCaPip2","PlcCaGqaPip2"],
        "PKA":["PKA", "PKAcAMP2", "PKAcAMP4", "PKAr"]}
tot_species=["D1R","m4R", "m1R","Gi", "Gs", "Gq", "Plc", "AC5", "PI", "PKA","D32", "PDE10","PP2A", "PP2B", "PP1", "Cam", "CK", "Pkc", "Dgl","PDE4"]
tot_species=[]
###################################################

Avogadro=6.023e14 #to convert to nanoMoles
mol_per_nM_u3=Avogadro*1e-15

try:
    args = ARGS.split(",")
    print("ARGS =", ARGS, "commandline=", args)
    do_exit = False
except NameError: #NameError refers to an undefined variable (in this case ARGS)
    args = sys.argv[1:]
    print("commandline =", args)
    do_exit = True

ftuples,parlist,params=h5utils.argparse(args)
figtitle=args[0].split('/')[-1]

###################################################
signature_array=[]
parval=[]
whole_plot_array=[]
numfiles=len(ftuples)
for fnum,ftuple in enumerate(ftuples):
    fname=ftuple[0]
    parval.append(ftuple[1])
    data = h5.File(fname,"r")
    maxvols=len(data['model']['grid'])
    TotVol=data['model']['grid'][:]['volume'].sum()
    plot_array=[]
    time_array=[]
    all_spine_means=[]
    
    trials=[a for a in data.keys() if 'trial' in a]
    seeds=[data[trial]['simulation_seed'][:] for trial in trials]
    numtrials=len(trials)
    outputsets=data[trials[0]]['output'].keys()
    if numfiles==1:
        arraysize=numtrials
        params=['trial']
        parval=[str(x) for x in range(len(trials))]
        parlist=[parval,[]]
    else:
        arraysize=numfiles
    #
    ##########################################################
    #   Extract region and structure voxels and volumes
    ##########################################################
    if maxvols>1 and fnum==0:
        molecules=data['model']['species'][:]
        structType=data['model']['grid'][:]['type']
        region_list,region_dict,region_struct_dict=h5utils.subvol_list(structType,data['model'])
        dsm_tot=np.zeros((arraysize,len(tot_species)))
        head_tot=np.zeros((arraysize,len(tot_species)))
        dsm_name=dend+submembname
        try:
            dsm_vox=list(region_struct_dict.keys()).index(dsm_name)
        except ValueError:
            dsm_vox=-1
        #Replace the following with test for whether there is more than one "group"
        try:
            head_index=list(region_dict.keys()).index(spinehead)
        except ValueError:
            head_index=-1
        if head_index>0:
            #create "group" dictionary-spinelist & spinevox, with one more for nonspine voxels
            spinelist,spinevox=h5utils.multi_spines(data['model'])
        else:
            spinelist=''
    #
    ##### Initialization done only for first file in the list
    #
    if fnum==0:
        #initialize plot stuff, arrays for static measurements, and find molecules among the output sets
        if len(args[2].split()):
            plot_molecules=args[2].split()
        else:
            plot_molecules=molecules
        num_mols=len(plot_molecules)
        out_location,dt,rows=h5utils.get_mol_info(data,plot_molecules,maxvols)
        #
        ss_tot=np.zeros((arraysize,len(tot_species)))
        slope=np.zeros((arraysize,num_mols))
        peaktime=np.zeros((arraysize,num_mols))
        baseline=np.zeros((arraysize,num_mols))
        peakval=np.zeros((arraysize,num_mols))
        lowval=np.zeros((arraysize,num_mols))
        sstart=np.zeros((num_mols),dtype=np.int)
        ssend=np.zeros((num_mols),dtype=np.int)
        #
        if len(args)>3:
            for imol,molecule in enumerate(plot_molecules):
                if out_location[molecule]!=-1:
                    sstart[imol] = float(args[3].split(" ")[0]) // dt[imol]
                    ssend[imol] = float(args[3].split(" ")[1]) // dt[imol]
                    if ssend[imol]>0.5*rows[imol]:
                        print("WARNING*******. Possible SS time issue: only", rows, "rows")
                    if ssend[imol]>rows[imol]:
                        ssend[imol]=0.1*rows[imol]
                        sstart[imol]=0.075*rows[imol]
                        print ("WARNING *****. ssend exceeds sim time, reassigning to ", ssend[imol]*dt)
        else:
            for imol,molecule in enumerate(plot_molecules):
                if out_location[molecule]!=-1:
                    sstart[imol]=int(0.075*rows[imol])
                    ssend[imol]=int(0.1*rows[imol])
    ######################################
    #Calculate various region averages, such as soma and dend, subm vs cyt, spines
    ######################################
    if maxvols>1:
        print(params, "=",parval[fnum], "voxels=",maxvols)
        molecule_name_issue=0
        for imol,molecule in enumerate(plot_molecules):
          if out_location[molecule]!=-1:
            molecule_pop,time=h5utils.get_mol_pop(data,out_location[molecule],maxvols,trials)
            time_array.append(time)
            #calculate region means
            header,RegionMeans,RegMeanStd=h5utils.region_means_dict(molecule_pop,region_dict,time,molecule,trials)
            #calculate region-structure means
            header2,RegionStructMeans,RegStructMeanStd=h5utils.region_means_dict(molecule_pop,region_struct_dict,time,molecule,trials)
            #if more than one spine, calculate individual spine means
            if len(spinelist)>0:
                spineheader,spinemeans,spineMeanStd=h5utils.region_means_dict(molecule_pop,spinevox,time,molecule,trials)
            else:
                spineheader=''
            #calculate overall mean
            OverallMean=np.zeros((numtrials,len(time)))
            OverallMean[:,:]=np.sum(molecule_pop[:,:,:],axis=2)/(TotVol*mol_per_nM_u3)
            header='#time ' +header+header2+molecule+'AvgTot\n'
            #
            if showplot==2:
                if stimspine in spinelist:
                    spine_index=spinelist.index(stimspine)
                    if fnum==0 and imol==0:
                        figtitle=figtitle+' '+stimspine
                else:
                    spine_index=0
                    if fnum==0 and imol==0:
                        figtitle=figtitle+' '+'nonspine'
                #TEST THIS PART FOR MULTIPLE SPINES/TRIALS
                if numfiles>1:
                    plot_array.append(np.mean(spinemeans,axis=0)[:,spine_index])
                else:
                    plot_array.append(spinemeans[:,:,spine_index])
            else:
                if numfiles>1:
                    plot_array.append(np.mean(OverallMean,axis=0))
                    #plot_array dimensions=number of molecules x sample times
                else:
                    plot_array.append(OverallMean)
                    #plot_array dimensions=number of molecules x number of trials x sample times
            if calc_signature==2:
                if numfiles>1:
                    #dimensions will be number of molecules x sample times x (1+ num spines)
                    all_spine_means.append(np.mean(spinemeans,axis=0))
                else:
                    #dimensions will be number of molecules x number of trials x sample times x 1+ num spines
                    all_spine_means.append(spinemeans)
            #
            ############# write averages to separate files #######################3
            if outputavg:
                 if molecule in plot_molecules:
                    outfname=fname[0:-3]+'_'+molecule+'_avg.txt'
                    print('output file: ', outfname)
                    newheader=''
                    newheaderstd=''
                    for item in header.split():
                        newheader=newheader+params[0]+parval[fnum]+'_'+item+' '
                        if not item.startswith('#'):
                            newheaderstd=newheaderstd+params[0]+parval[fnum]+'_'+item+'std '
                    if numtrials>1:
                        newheader=newheader+newheaderstd
                        region_out=np.column_stack((RegMeanStd['mean'],RegStructMeanStd['mean'],RegMeanStd['std'],RegStructMeanStd['std']))
                        overall_out=np.column_stack((np.mean(OverallMean,axis=0),np.std(OverallMean,axis=0)))
                    else:
                        region_out=np.column_stack((RegionMeans[0,:,:],RegionStructMeans[0,:,:]))
                        overall_out=OverallMean[0,:]
                    if len(spinelist)>1:
                        newspinehead=''
                        newspineheadstd=''
                        for item in spineheader.split():
                            newspinehead=newspinehead+params[0]+parval[fnum]+'_'+item+' '
                            newspineheadstd=newspineheadstd+params[0]+parval[fnum]+'_'+item+'std '
                        if numtrials>1:
                            newheader=newheader+newheaderstd+newspinehead+newspineheadstd+'\n'
                            outdata=np.column_stack((time,region_out,overall_out,spineMeanStd['mean'],spineMeanStd['std']))
                        else:
                            newheader=newheader+newspinehead+'\n'
                            outdata=np.column_stack((time,region_out,overall_out,spinemeans[0,:,:]))
                    else:
                        newheader=newheader+'\n'
                        outdata=np.column_stack((time,region_out,overall_out))
                    f=open(outfname, 'w')
                    ############## NEED TO FIX HEADER FOR MULTI-TRIALS - INCLUDE STDEV ################3
                    f.write(newheader)
                    np.savetxt(f, outdata, fmt='%.4f', delimiter=' ')
                    f.close()
            if print_head_stats:
                print(molecule.rjust(14), end=' ')
                if head_index>-1:
                    if len(spinelist)>1:
                        stimspinenum=list(spinelist).index(stimspine)
                        headmean=np.mean(np.mean(spinemeans[:][sstart[imol]:ssend[imol],stimspinenum],axis=0),axis=0)
                        headmax=np.mean(spinemeans[:][sstart[imol]:ssend[imol],stimspinenum],axis=0).max()
                    else:
                        headmean=np.mean(RegionMeans[:,sstart[imol]:ssend[imol],head_index])
                        tempmax=np.max(RegionMeans[:,ssend[imol]:,head_index],axis=1)
                        headmax=np.mean(tempmax)
                    print("head ss:%8.4f pk %8.4f " % (headmean, headmax), end=' ')
                if dsm_vox>-1:
                    dsm_max=np.max(RegionStructMeans[:,ssend[imol]:,dsm_vox],axis=1)
                    print("dend sm %8.4f pk %8.4f" %((RegionStructMeans[:,sstart[imol]:ssend[imol],dsm_vox].mean()*region_struct_dict[dsm_name]['depth']),
                                                     (np.mean(dsm_max)*region_struct_dict[dsm_name]['depth'])))
          else:
              if fnum==0 and molecule_name_issue==0:
                  print("Choose molecules from:", molecules)
                  molecule_name_issue=1
              plot_array.append([-1])
              #
    else:
        ######################################
        #minimal processing needed if only a single voxel.
        #Just extract, calculate ss, and plot specified molecules
        #might want to create output files with mean and stdev
        ######################################
        voxel=0
        for mol in plot_molecules:
          if out_location[mol]!=-1:
            outset = out_location[mol]['location'].keys()[0]
            imol=out_location[mol]['location'][outset]['mol_index']
            tempConc=np.zeros((numtrials,out_location[mol]['samples']))
            time_array.append(data[trials[0]]['output'][outset]['times'][:]/1000)
            #generate output files for these cases
            for trialnum,trial in enumerate(trials):
                tempConc[trialnum]=data[trial]['output'][outset]['population'][:,voxel,imol]/TotVol/mol_per_nM_u3
            if numfiles>1:
                 plot_array.append(np.mean(tempConc,axis=0))
                 #plot_array dimensions=numfiles x number of molecules x sample times
            else:
                #plot_array dimensions=number of molecules (x number of trials) x sample times
                plot_array.append(tempConc)
          else:
              print("molecule", molecule, "not found in output data!!!!!!!!!!!")
              if fnum==0:
                  print("choose from:", molecules)
              plot_array.append([-1])
    ######################################
    #Whether 1 voxel or multi-voxel, create plotting array of means for all molecules, all files, all trials
    if numfiles>1:
        #plot_array dimensions=num molecules x sample times
        #whole_plot_array dimension=num files*num molecules*sample time
        whole_plot_array.append(plot_array)
        #dimensions of signature array = num files x num mol x sample times x (1+numspines)
        if calc_signature==2:
            signature_array.append(all_spine_means)
    else:
        #dimensions of plot_array=num molecules x num trials x sample times
        #whole_plot_array dimension=num trials*num molecules*sample time
        whole_plot_array=np.swapaxes(plot_array,0,1)
        #dimensions of signature array = num mol x num trials x sample times x (1+numspines)
        if calc_signature==2:
            signature_array=np.swapaxes(all_spine_means,0,1)
    if 'event_statistics' in data['trial0']['output'].keys() and show_inject:
        print ("seeds", seeds," injection stats:")
        for inject_sp,inject_num in zip(data['model']['event_statistics'][:],data['trial0']['output']['event_statistics'][0]):
            print (inject_sp.split()[-1].rjust(20),inject_num[:])
    #
    ###################################################
    #   in both cases (single voxel and multi-voxel):
    #   total some molecule forms, to verify initial conditions
    ###################################################
    #
    outset="__main__"
    for imol,mol in enumerate(tot_species):
        mol_set=[]
        #first set up arrays of all species (sub_species) that are a form of the molecule
        if mol in sub_species.keys():
            mol_set=sub_species[mol]
        else:
            for subspecie in data['model']['output']['__main__']['species'][:]:
                if mol in subspecie:
                    mol_set.append(subspecie)
        #second, find molecule index of the sub_species and total them
        for subspecie in mol_set:
            mol_index=h5utils.get_mol_index(data,outset,subspecie)
            mol_pop=data['trial0']['output'][outset]['population'][0,:,mol_index]
            ss_tot[fnum,imol]+=mol_pop.sum()/TotVol/mol_per_nM_u3
            if maxvols>1:
                if dsm_vox>-1:
                    dsm_tot[fnum,imol]+=mol_pop[region_struct_dict[dsm_name]['vox']].sum()/region_struct_dict[dsm_name]['vol']*region_struct_dict[dsm_name]['depth']/mol_per_nM_u3
                else:
                    dsm_tot[fnum,imol]+=-1
                if head_index>-1:
                    head_tot[fnum,imol]+=mol_pop[region_dict[spinehead]['vox']].sum()/region_dict[spinehead]['vol']/mol_per_nM_u3
                else:
                    head_tot[fnum,imol]+=-1
        print("Total",mol, end=' ')
        if fnum==0:
            print(mol_set, end=' ')
        print(ss_tot[fnum,imol],"nM")
        if maxvols>1:
            print(" or head:",head_tot[fnum,imol],"nM, or dsm:", dsm_tot[fnum,imol], "picoSD")
#
#####################################################################
#after main processing, extract a few characteristics of molecule trajectory
#####################################################################
for pnum in range(arraysize):
    print(params, parval[pnum])
    print("        molecule  baseline  peakval   ptime    slope      min     ratio")
    for imol,mol in enumerate(plot_molecules):
      if out_location[mol]!=-1:
        baseline[pnum,imol]=whole_plot_array[pnum][imol][sstart[imol]:ssend[imol]].mean()
        peakpt=whole_plot_array[pnum][imol][ssend[imol]:].argmax()+ssend[imol]
        peaktime[pnum,imol]=peakpt*dt[imol]
        peakval[pnum,imol]=whole_plot_array[pnum][imol][peakpt-10:peakpt+10].mean()
        lowpt=whole_plot_array[pnum][imol][ssend[imol]:].argmin()+ssend[imol]
        lowval[pnum,imol]=whole_plot_array[pnum][imol][lowpt-10:lowpt+10].mean()
        begin_slopeval=0.2*(peakval[pnum,imol]-baseline[pnum,imol])+baseline[pnum,imol]
        end_slopeval=0.8*(peakval[pnum,imol]-baseline[pnum,imol])+baseline[pnum,imol]
        exceedsthresh=np.where(whole_plot_array[pnum][imol][ssend[imol]:]>begin_slopeval)
        begin_slopept=0
        end_slopept=0
        found=0
        if len(exceedsthresh[0]):
            begin_slopept=np.min(exceedsthresh[0])+ssend[imol]
            found=1
            exceedsthresh=np.where(whole_plot_array[pnum][imol][begin_slopept:]>end_slopeval)
            if len(exceedsthresh[0]):
                end_slopept=np.min(exceedsthresh[0])+begin_slopept
            else:
                found=0
        if found and len(whole_plot_array[pnum][imol][begin_slopept:end_slopept])>1:
                slope[pnum,imol]=(peakval[pnum,imol]-baseline[pnum,imol])/((end_slopept-begin_slopept)*dt[imol])
        else:
                slope[pnum,imol]=-9999
        print(mol.rjust(16),"%8.2f" % baseline[pnum,imol],"%8.2f" %peakval[pnum,imol], end=' ')
        print("%8.2f" % peaktime[pnum,imol], "%8.3f" %slope[pnum,imol], "%8.2f" %lowval[pnum,imol], end=' ')
        if baseline[pnum,imol]>1e-5:
            print("%8.2f" %(peakval[pnum,imol]/baseline[pnum,imol]))
        else:
            print("   inf")
#
#####################################################################
#Now plot some of these molcules, either single voxel or overall average if multi-voxel
#also calculate the signature
#####################################################################
#
if showplot:
    fig,axes,col_inc,scale,numpar=pu5.plot_setup(plot_molecules,parlist,params)
    #need fnames
    fig.suptitle(figtitle)
    for pnum in range(arraysize):
        pu5.plottrace(plot_molecules,time_array,whole_plot_array[pnum],parval[pnum],axes,fig,col_inc,scale,parlist)
    #
if calc_signature:
    #just sum over molecules.  Could add normalization.  Need more params to subtract or divide by some molecules
    auc_label=[]
    sign_title=''
    for mol in plot_molecules:
        sign_title=sign_title+mol+'+'
    if calc_signature==1:   #simple signature - average over whole structure
        signature=np.sum(whole_plot_array,axis=1)
        #signature dimensions=num files/trials x sample times
        auc=np.zeros(len(parval))
    elif calc_signature==2: #separate spine and dendrite signatures
        signature=np.sum(signature_array,axis=1)
        #signature dimensions=num files/trials x sample times x (1+numspines)
        num_spines=np.shape(signature)[-1]
        auc=np.zeros((len(parval),num_spines))
    #area between signature and basal
    basal_sig=np.mean(signature[:,sstart[0]:ssend[0]],axis=1)
    if calc_signature==1:
        for par in range(len(parval)):
            label=h5utils.join_params(parval[par],params)
            auc[par]=np.sum(signature[par,:]-basal_sig[par])*dt[0]/1000
            auc_label.append(label+" auc="+str(auc[par]))
    elif calc_signature==2:
        auc_label=[[] for sp in range(len(parval))]
        for par in range(len(parval)):
            label=h5utils.join_params(parval[par],params)
            for sp in range(num_spines):
                auc[par,sp]=np.sum(signature[par,:,sp]-basal_sig[par,sp])*dt[0]/1000
                auc_label[par].append(label+" auc="+str(auc[par,sp])+" "+spinelist[sp])
    pu5.plot_signature(auc_label,signature,time,sign_title)
#
#then plot the steady state versus parameter value for each molecule
#Needs to be fixed so that it works with non numeric parameter values
#is ss the baseline?  Or measuring at some other time point?
ss=baseline
if len(params)>1:
        #print(np.column_stack((parval,ss)))
        xval=[]
        for i,pv in enumerate(parval):
                if len(parlist[0])>len(parlist[1]):
                        xval.append(pv[0])
                else:
                        xval.append(pv[1])
        print(xval)
        if showss:
                pu5.plotss(plot_molecules,xval,ss)
else:
    if showss:
        #also plot the totaled molecule forms
        if len(tot_species.keys()):
                pu5.plotss(plot_molecules+tot_species.keys(),parval,np.hstack((ss,ss_tot)))
        else:
                pu5.plotss(plot_molecules,parval,ss)
