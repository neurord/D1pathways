#sig.py
#calculate LTP/LTD signature from two sets of molecules, separately for spines and dendrites
#USAGE: in python, type ARGS="subdir/fileroot,par1 par2,LTPmol1 LTPmol2,,LTDmol1 LTdmol2,basal_start basal_end" then execfile('sig.py')
#DO NOT PUT ANY SPACES NEXT TO THE COMMAS, DO NOT USE TABS, rows is optional
#LTPmol1 LTPmol2, etc are the names of molecles which produce LTP is sufficiently high (and hinder LTD)
#LTDmol1 LTDmol2, etc are the names of molecles which produce LTD is sufficiently high (and hinder LTP)
#par1 and optionally par2 are specifications of parameter variations, as follows:
#The filenames to read in are constructed as "subdir/fileroot"+"-"+par1+"*"-"+par2+"*"
#DO NOT use hyphens in filenames except for preceding parameter name
#if no parameters specified, then fileroot needs to be full filename (excluding the extension)
#from outside python, type python sig.py "subdir/fileroot [par1 par2] [mol1 mol2]"


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
spinehead="head"
stimspine='sa1[0]' #"name" of (stimulated) spine
msec_per_sec=1000

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

try:
    data.close()
except Exception:
    pass

###################################################
parval=[]
numfiles=len(ftuples)
signature_array=[]
for fnum,ftuple in enumerate(ftuples):
    fname=ftuple[0]
    parval.append(ftuple[1])
    data = h5.File(fname,"r")
    maxvols=len(data['model']['grid'])
    TotVol=data['model']['grid'][:]['volume'].sum()
    time_array=[]
    sig_data=[]
    #
    trials=[a for a in data.keys() if 'trial' in a]
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
        #
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
    ##########################################################
    #   Initialize some arrays and get molecule-region output set information
    ##########################################################
    if fnum==0:
        #
        #Get list of molecules for LTP and list for LTD.  identify which output sets and voxels they are in
        ltp_molecules=args[2].split()
        num_ltpmols=len(ltp_molecules)
        ltd_molecules=args[3].split()
        num_ltdmols=len(ltd_molecules)
        all_molecules=ltp_molecules+ltd_molecules
        num_mols=len(all_molecules)
        if numfiles>1:
            for mol in range(num_mols):
                signature_array.append([])
        #
        out_location,dt,rows=h5utils.get_mol_info(data,all_molecules,maxvols)
        #
        #Which "rows" should be used for baseline value, specifed in args[4]
        #
        sstart,ssend=h5utils.sstart_end(all_molecules, args, 4, out_location,dt,rows)
    ######################################
    #Calculate region averages, such as indivivdual spines and non-spines
    ######################################
    if maxvols>1:
        for imol,molecule in enumerate(all_molecules):
          if out_location[molecule]!=-1:
            molecule_pop,time=h5utils.get_mol_pop(data,out_location[molecule],maxvols,trials)
            time_array.append(time)
            #calculate non-spine mean and individual spine means
            spineheader,spinemeans,spineMeanStd=h5utils.region_means_dict(molecule_pop,spinevox,time,molecule,trials)
            if numfiles>1:
                #dimensions will be number of molecules x sample times x (1+ num spines)
                sig_data.append(np.mean(spinemeans,axis=0))
            else:
                #dimensions will be number of molecules x number of trials x sample times x 1+ num spines
                sig_data.append(spinemeans)
    ######################################
    #minimal processing needed if only a single voxel.
    ######################################
    else:
        voxel=0
        for mol in all_molecules:
          if out_location[mol]!=-1:
            outset = out_location[mol]['location'].keys()[0]
            imol=out_location[mol]['location'][outset]['mol_index']
            tempConc=np.zeros((numtrials,out_location[mol]['samples']))
            time_array.append(data[trials[0]]['output'][outset]['times'][:]/msec_per_sec)
            #generate output files for these cases
            for trialnum,trial in enumerate(trials):
                tempConc[trialnum]=data[trial]['output'][outset]['population'][:,voxel,imol]/TotVol/mol_per_nM_u3
            if numfiles>1:
                 sig_data.append(np.mean(tempConc,axis=0))
                 #sig_data dimensions=number of molecules x sample times
            else:
                #sig_data dimensions=number of molecules (x number of trials) x sample times
                sig_data.append(tempConc)
          else:
              print("molecule", molecule, "not found in output data!!!!!!!!!!!")
              if fnum==0:
                  print("choose from:", molecules)
              sig_data.append([-1])
    ######################################
    #Whether 1 voxel or multi-voxel, create array of means for all molecules, all files, all trials
    ##########################################
    if numfiles>1:
        for mol in range(num_mols):
            signature_array[mol].append(sig_data[mol])
    else:
        signature_array=sig_data
#####################################################################
#Calculate signature
#####################################################################
auc_label=[]
sign_title=''
for mol in ltp_molecules:
    sign_title=sign_title+'+'+mol
for mol in ltd_molecules:
    sign_title=sign_title+'-'+mol
signature=np.zeros(np.shape(np.sum(signature_array,axis=0)))
if maxvols==1:
    auc=np.zeros(len(parval))
else:
    num_spines=np.shape(signature)[-1]
    auc=np.zeros((len(parval),num_spines))
#############################
#customize this part.  E.g.
#add values of LTP molecules
for each_mol in ltp_molecules:
    col=all_molecules.index(each_mol)
    for f in range(numfiles):
        #subtract basal value from trace
        basal=np.mean(signature_array[col][f][sstart[0]:ssend[0]],axis=0)
        sig_subtracted=signature_array[col][f]-basal
        signature[f]=signature[f]+sig_subtracted
#subtract LTD molecules
for each_mol in ltd_molecules:
    col=all_molecules.index(each_mol)
    for f in range(numfiles):
        #subtract basal value from trace
        basal=np.mean(signature_array[col][f][sstart[0]:ssend[0]],axis=0)
        sig_subtracted=signature_array[col][f]-basal
        signature[f]=signature[f]-sig_subtracted
#signature dimensions=num files/trials x sample times x (1+numspines)
#End customization
#############################
#area between signature and basal
basal_sig=np.mean(signature[:,sstart[0]:ssend[0]],axis=1)
if maxvols==1:
    for par in range(len(parval)):
        label=h5utils.join_params(parval[par],params)
        auc[par]=np.sum(signature[par,:]-basal_sig[par])*dt[0]/msec_per_sec
        auc_label.append(label+" auc="+str(auc[par]))
else:
    auc_label=[[] for sp in range(len(parval))]
    for par in range(len(parval)):
        label=h5utils.join_params(parval[par],params)
        for sp in range(num_spines):
            auc[par,sp]=np.sum(signature[par,:,sp]-basal_sig[par,sp])*dt[0]/msec_per_sec
            auc_label[par].append(label+" auc="+str(auc[par,sp])+" "+spinelist[sp])
pyplot.ion()
pu5.plot_signature(auc_label,signature,time,sign_title)
