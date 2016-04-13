#neurordh5_analysis.py
#in python, type ARGS="par1 par2,mol1 mol2,subdir/fileroot,sstart ssend,rows" then execfile('neurordh5_analysis.py')
#DO NOT PUT ANY SPACES NEXT TO THE COMMAS, DO NOT USE TABS, rows is optional
#if mol ommitted, then all molecules processed
#e.g. ARGS="Ca GaqGTP,Ca GaqGTP Ip3,../Repo/plc/Model_PLCassay,15 20" time units are sec
#from outside python, type python neurordh5_analysis [par1 par2] [mol1 mol2]
#Assumes that molecule outputs are integers, and the hypens used ONLY for parameters
#Can process multiple parameter variations, but all files must use same morphology, and meshfile.  
#It will provide region averages (each spine, dendrite submembrane, cytosol)
#Future improvements:
#   1. spatial average along dendrite
#   2. deal with output sets that store a subset of voxels
#   3. identify which molecules are same species to calculate total

import os
import numpy as np
from matplotlib import pyplot
from string import *
import sys  
import glob
import h5utils
import plot_h5 as pu
import h5py as h5

#######################################################
#indicate the name of the injection spines if you want to exclude them
fake = 'FAKE'
#indicate the name of submembrane region for totaling molecules that are exclusively submembrane
#only relevant for tot_species calculation. this should be name of structure concatenated with sub
submembname='sub'
#Spatial average (=1 to process) only includes the structure "dend", and subdivides into bins:
spatialaverage=0
dend="dend"
spinehead="head"
bins=10
#how much info to print
prnvox=1
prninfo=0
showss=0
#outputavg determines whether output files are written
outputavg=0
showplot=1

#Example of how to total some molecule forms; turn off with tot_species={}
#tot_species={
#        "PKAtot":["PKA", "PKAcAMP2", "PKAcAMP4", "PKAr"],
#        "D1Rtot":["D1R","DaD1R", "GsD1R","DaD1RGs", "pDaD1RGs", "PKAcDaD1RGs"],
#        "pde10tot":["PDE10","pPDE10", "PDE10cAMP","pPDE10cAMP","PKAcPDE10", "PKAcPDE10cAMP"],
#        "Gitot":["Giabg","AChm4RGi","Gim4R", "GaiGTP", "GaiGDP", "ACGai", "ACGasGai", "ACGasGaiATP"],
#        "m4Rtot":["AChm4RGi","Gim4R", "m4R", "AChm4R"]}
#if use proper naming convention, can find most species with PKA or D1R instead of specifying by hand
#allow the list of tot_species to be greater than the dictionary above
#will need to do PKA and Pip2/Ip3 separately
tot_species={}
###################################################

Avogadro=6.023e14 #to convert to nanoMoles
mol_per_nM_u3=Avogadro*1e-15

try:
    args = ARGS.split(",")
    print "ARGS =", ARGS, "commandline=", args
    do_exit = False
except NameError: #NameError refers to an undefined variable (in this case ARGS)
    args = sys.argv[1:]
    print "commandline =", args
    do_exit = True

ftuples,parlist,params=h5utils.argparse(args)
figtitle=args[2].split('/')[-1]
numfiles=len(ftuples)
ss_tot=np.zeros((numfiles,len(tot_species.keys())))

###################################################

parval=[]
for fnum,ftuple in enumerate(ftuples):
    fname=ftuple[0]
    parval.append(ftuple[1])
    data = h5.File(fname,"r")
    maxvols=len(data['model']['grid'])
    TotVol=data['model']['grid'][:]['volume'].sum()
    plot_array=[]
    time_array=[]
    
    if len(data.keys())==3:     #only a single trial
        outputsets=data['trial0']['output'].keys()
    #else - will need to average over multiple trials eventually.

    ##### Initialization done only for first file in the list
    #Extract region and structure voxels and volumes
    if maxvols>1 and fnum==0:
        molecules=data['model']['species'][:]
        structType=data['model']['grid'][:]['type']
        region_list,region_vox,region_struct_list,region_struct_vox,region_struct_deltaY=h5utils.subvol_list(structType,data['model'])
        RegVol=h5utils.region_volume(region_list,region_vox,data['model']['grid']['volume'],prnvox)
        RegStructVol=h5utils.region_volume(region_struct_list,region_struct_vox,data['model']['grid']['volume'],prnvox)
        #
        dsm_vox=region_struct_list.index(dend+submembname)
        try:
            head_vox=list(region_list[:]).index(spinehead)
        except ValueError:
            head_vox=-1

        submembVol=0
        for region in region_list:
            smname=region+submembname
            if smname in region_struct_list:
                submembVol+=RegStructVol[region_struct_list.index(smname)]
    #Finished extracting region and structure voxels and volumes
    #
    if fnum==0:
        #initialize plot stuff, arrays for static measurements, and find molecules among the output sets
        if len(args[1].split()):
            plot_molecules=args[1].split()
        else:
            plot_molecules=molecules
        out_location,dt,rows=h5utils.get_mol_info(data,plot_molecules,maxvols)
        if showplot:
            fig,axes,col_inc,scale,numpar=pu.plot_setup(plot_molecules,parlist,params)
            #need fnames
            fig.suptitle(figtitle)
        #
        ss=np.zeros((numfiles,len(plot_molecules)))
        slope=np.zeros((numfiles,len(plot_molecules)))
        peaktime=np.zeros((numfiles,len(plot_molecules)))
        baseline=np.zeros((numfiles,len(plot_molecules)))
        peakval=np.zeros((numfiles,len(plot_molecules)))
        lowval=np.zeros((numfiles,len(plot_molecules)))
        sstart=np.zeros((len(plot_molecules)),dtype=np.int)
        ssend=np.zeros((len(plot_molecules)),dtype=np.int)
        if len(args)>3:
            for imol,molecule in enumerate(plot_molecules):
                if out_location[molecule]!=-1:
                    sstart[imol]=int(float(args[3].split(" ")[0])/dt[imol])
                    ssend[imol]=int(float(args[3].split(" ")[1])/dt[imol])
                    if ssend[imol]>0.5*rows[imol]:
                        print "WARNING*******. Possible SS time issue: only", rows, "rows"
        else:
            for imol,molecule in enumerate(plot_molecules):
                if out_location[molecule]!=-1:
                    sstart[imol]=int(0.075*rows[imol])
                    ssend[imol]=int(0.1*rows[imol])
    ######################################
    #Calculate various region averages, such as soma and dend, subm vs cyt, 
    #use the above lists and volume of each region, and each region-structure
    ######################################
    if maxvols>1:
        for imol,molecule in enumerate(plot_molecules):
          if out_location[molecule]!=-1:
            molecule_pop,time=h5utils.get_mol_pop(data,out_location[molecule],maxvols)
            time_array.append(time)
            #calculate region means
            header,RegionMeans=h5utils.region_means(molecule_pop,region_list,region_vox,RegVol,time,molecule)
            #calculate region-structure menas
            header2,RegionStructMeans=h5utils.region_means(molecule_pop,region_struct_list,region_struct_vox,RegStructVol,time,molecule)
            #calculate overall mean
            OverallMean=np.zeros(len(time))
            for itime in range(len(time)):
                for k in range(maxvols):
                    OverallMean[itime]+=molecule_pop[itime,k]
            OverallMean[:]/=(TotVol*mol_per_nM_u3)
            header='#time ' +header+header2+molecules[imol]+'AvgTot\n'
            #
            plot_array.append(OverallMean)
            #
            #write averages to separate files
            if outputavg:
                outfname=fname[0:-8]+molecule+'_avg.txt'
                if molecule in plot_molecules:
                    print 'output file: ', outfname
                    outdata=np.column_stack((time,RegionMeans,RegionStructMeans,OverallMean))
                    f=open(outfname, 'w')
                    f.write(header)
                    np.savetxt(f, outdata, fmt='%.4f', delimiter=' ')
                    f.close()
            else:
                print molecule.rjust(14),
                if head_vox>-1:
                    print "head ss:%8.4f pk %8.4f " % (RegionMeans[sstart[imol]:ssend[imol],head_vox].mean(), RegionMeans[ssend[imol]:,head_vox].max()),
                print "dend sm %8.4f pk %8.4f" %((RegionStructMeans[sstart[imol]:ssend[imol],dsm_vox].mean()*region_struct_deltaY[dsm_vox]),
                                                     (RegionStructMeans[ssend[imol]:,dsm_vox].max()*region_struct_deltaY[dsm_vox]))
          else:
              print "molecule", molecule, "not found in output data!!!!!!!!!!!"
              plot_array.append([-1])
              #
    else:
        #no processing needed if only a single voxel.  Just extract, calculate ss, and plot specified molecules
        for imol,mol in enumerate(plot_molecules):
          if out_location[mol]!=-1:
            voxel=0
            for outset in out_location[2].keys():
                tempConc=data['trial0']['output'][outset]['population'][:,out_location[2][outset]['mol_index']]/TotVol/mol_per_nM_u3
                plot_array.append(tempConc)
          else:
              print "molecule", molecule, "not found in output data!!!!!!!!!!!"
              plot_array.append([-1])
    #
    #in both cases (single voxel and multi-voxel):
    #########total some molecule forms - specified by hand above for now
    #
    #edit from neurord_analysis.py
    #
    #####################################################################
    #after main processing, extract a few characteristics of molecule trajectory
    #####################################################################
    print params, parval[fnum]
    print "        molecule  baseline  peakval   ptime    slope      min     ratio"
    for imol,mol in enumerate(plot_molecules):
      if out_location[molecule]!=-1:
        ss[fnum,imol]=plot_array[imol][sstart[imol]:ssend[imol]].mean()
        baseline[fnum,imol]=plot_array[imol][sstart[imol]:ssend[imol]].mean()
        peakpt=plot_array[imol][ssend[imol]:].argmax()+ssend[imol]
        peaktime[fnum,imol]=peakpt*dt[imol]
        peakval[fnum,imol]=plot_array[imol][peakpt-10:peakpt+10].mean()
        lowpt=plot_array[imol][ssend[imol]:].argmin()+ssend[imol]
        lowval[fnum,imol]=plot_array[imol][lowpt-10:lowpt+10].mean()
        begin_slopeval=0.2*(peakval[fnum,imol]-baseline[fnum,imol])+baseline[fnum,imol]
        end_slopeval=0.8*(peakval[fnum,imol]-baseline[fnum,imol])+baseline[fnum,imol]
        exceedsthresh=np.where(plot_array[imol][ssend[imol]:]>begin_slopeval)
        begin_slopept=0
        end_slopept=0
        found=0
        if len(exceedsthresh[0]):
            begin_slopept=np.min(exceedsthresh[0])+ssend[imol]
            found=1
            exceedsthresh=np.where(plot_array[imol][begin_slopept:]>end_slopeval)
            if len(exceedsthresh[0]):
                end_slopept=np.min(exceedsthresh[0])+begin_slopept
            else:
                found=0
        if found and len(plot_array[imol][begin_slopept:end_slopept])>1:
                slope[fnum,imol]=(peakval[fnum,imol]-baseline[fnum,imol])/((end_slopept-begin_slopept)*dt[imol])
        else:
                slope[fnum,imol]=-9999
        print mol.rjust(16),"%8.2f" % baseline[fnum,imol],"%8.2f" %peakval[fnum,imol],
        print "%8.2f" % peaktime[fnum,imol], "%8.3f" %slope[fnum,imol], "%8.2f" %lowval[fnum,imol],
        if baseline[fnum,imol]>1e-5:
            print  "%8.2f" %(peakval[fnum,imol]/baseline[fnum,imol])
        else:
            print "   inf"
    #
    #Now plot some of these molcules, either single voxel or overall average if multi-voxel
    #
    if showplot:
        pu.plottrace(plot_molecules,time_array,plot_array,parval[fnum],axes,fig,col_inc,scale,parlist)
    #
#then plot the steady state versus parameter value for each molecule
#Needs to be fixed so that it works with non numeric parameter values
if len(params)>1:
        print np.column_stack((parval,ss))
        xval=[]#np.zeros(len(parval))
        for i,pv in enumerate(parval):
                if len(parlist[0])>len(parlist[1]):
                        xval.append(pv[0])
                else:
                        xval.append(pv[1])
        print xval
        if showss:
                pu.plotss(plot_molecules,xval,ss)
else:
    if showss:
        #also plot the totaled molecule forms
        if len(tot_species.keys()):
                pu.plotss(plot_molecules+tot_species.keys(),parval,np.hstack((ss,ss_tot)))
        else:
                pu.plotss(plot_molecules,parval,ss)

