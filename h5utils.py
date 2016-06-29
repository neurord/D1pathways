from __future__ import print_function
import numpy as np
from string import *
import glob
import os
import plot_h5 as pu5
from collections import OrderedDict
Avogadro=6.023e14 #to convert to nanoMoles
mol_per_nM_u3=Avogadro*1e-15

####### FIX/IMPROVE THIS by going back from last outputset, only using outset __main__ if no voxels?
def get_mol_info(simData,plot_molecules,gridpoints):
    outputsets=simData['model']['output'].keys()
    dt=np.zeros((len(plot_molecules)))
    samples=np.zeros((len(plot_molecules)),dtype=int)
    out_location={}
    for imol,molecule in enumerate(plot_molecules):
        temp_dict={}
        tot_voxels=0
        for outset in outputsets[1:]:           #better to go backward from last set, and then go to 0 set if mol not found
        #for each in outputsets[-1::-1] and while tot_voxels>grid_points:
            mol_index=get_mol_index(simData,outset,molecule)
            if mol_index>-1:
                samples[imol]=len(simData['trial0']['output'][outset]['times'])
                dt[imol]=simData['trial0']['output'][outset]['times'][1]/1000. #convert msec to sec
                tot_voxels=tot_voxels+len(simData['model']['output'][outset]['elements'])
                temp_dict[outset]={'mol_index':mol_index,'elements':simData['model']['output'][outset]['elements'][:]}
        if len(temp_dict)>0:
            out_location[molecule]={'samples':samples[imol],'dt':dt[imol],'voxels': tot_voxels,'location': temp_dict}
        else:
            outset=outputsets[0]
            print("************* MOLECULE",molecule, " NOT IN REGULAR OUTPUT SETS !")
            mol_index=get_mol_index(simData,outset,molecule)
            if mol_index>-1:
                samples[imol]=len(simData['trial0']['output'][outset]['times'])
                dt[imol]=simData['trial0']['output'][outset]['times'][1]/1000. #convert msec to sec
                temp_dict[outset]={'mol_index':mol_index,'elements':simData['model']['output'][outset]['elements'][:]}
                out_location[molecule]={'samples':samples[imol],'dt':dt[imol],'voxels': gridpoints,'location': temp_dict}
            else:
                out_location[molecule]=-1
                print("** Even Worse: MOLECULE",molecule, " DOES NOT EXIST !!!!!!!!!!!!!")
    return out_location,dt,samples
         
def get_mol_index(simData,outputset,molecule):
    indices=np.where(simData['model']['output'][outputset]['species'][:]==molecule)[0]
    if len(indices) == 1:
        return indices[0]
    else:
        return -1

def get_mol_pop(simData, out_location,gridpoints,trials):
    samples=out_location['samples']
    conc=np.zeros((len(trials),samples,gridpoints))
    for outset in out_location['location'].keys():
        elements=out_location['location'][outset]['elements']
        time=simData[trials[0]]['output'][outset]['times'][:]/1000.     #Convert msec to sec
        for trialnum,trial in enumerate(trials):
            tempConc=simData[trial]['output'][outset]['population'][:,:,out_location['location'][outset]['mol_index']]
            #transpose required to undo the transpose automatically done by python when specifying elements as 3d index
            conc[trialnum,:,elements]=tempConc.T
    return conc,time

def argparse(args):

    def sortorder(ftuple):
        ans = ftuple[1]
        #print 'sort', ftuple, '->', ans
        return ans

    #1st and 2nd arguements used to construct pattern for reading in multiple files
    pattern=args[2]
    if len(args[0]):
        params=args[0].split(" ")
        for par in params:
            pattern=pattern+'-'+par+'*'
    else:
        params=[]
    whole_pattern=pattern+'.h5'
    print("pattern:", pattern, whole_pattern)

    lastslash=str.rfind(pattern,'/')
    subdir=pattern[0:lastslash]

    fnames = glob.glob(whole_pattern)
    if len(params):
        fnames=[fname for fname in fnames if str.count(fname,'-')<=len(params)]

    print("files:", fnames)
    print("NUM FILES:", len(fnames), "CURRENT DIRECTORY:", os.getcwd(), ", Target directory:", subdir)
    if len(fnames)==0:
        print("FILES:", os.listdir(subdir+'/'+'*.h5'))
        #exit program

    parlist=[]
    if len(args[0]):
        ftuples,parlist=pu5.file_tuple(fnames,params)
        ftuples = sorted(ftuples, key=lambda x:x[1])
    else:
        ftuples=[(fnames[0],1)]
    return ftuples,parlist,params

from orderedmultidict import omdict
def subvol_list(structType,model):
    #use dictionaries to store voxels corresponding to regions, region_classes (e.g. head) or regions/structures
    region_list=model['regions']
    region_dict=OrderedDict()
    region_struct_dict=OrderedDict()
    #create dictionary of voxels and volumes for each region
    reg_voxel=omdict(( zip(model['grid'][:]['region'],range(len(model['grid'])) ) ))
    reg_voxel_vol=omdict(( zip(model['grid'][:]['region'],model['grid'][:]['volume'] ) ))
    for regnum in reg_voxel.keys():
        region_dict[region_list[regnum]]={'vox': reg_voxel.allvalues(regnum), 'vol': sum(reg_voxel_vol.allvalues(regnum))}
        # for regions of more than one type, create dictionary of voxels and volumes for each type of each region
        if len(np.unique(model['grid'][reg_voxel.allvalues(regnum)]['type']))>1:
            struct_voxels=omdict(( zip(model['grid'][reg_voxel.allvalues(regnum)]['type'],reg_voxel.allvalues(regnum)) ))
            struct_vox_vol=omdict(( zip(model['grid'][reg_voxel.allvalues(regnum)]['type'],reg_voxel_vol.allvalues(regnum)) ))
            for struct in struct_voxels.keys():
                depth=model['grid'][struct_voxels.allvalues(struct)]['y0']-model['grid'][struct_voxels.allvalues(struct)]['y2']
                #Depth is an array.  For submemb, only a single value, for cyt - different values.  Presently only storing one of the values
                region_struct_dict[region_list[regnum]+struct[0:3]]={'vox': struct_voxels.allvalues(struct),'depth':depth[0],'vol': sum(struct_vox_vol.allvalues(struct))}
    return region_list,region_dict,region_struct_dict

####### FIX/IMPROVE THIS USING omdict
def multi_spines(model,spinename):
    #create list of spine voxels
    spinelist=[]
    spinelist_vox=[]
    #first identify all spine voxels and spine labels
    for voxnum,voxgroup in enumerate(model['grid'][:]['group']):
        #using spinename means that spine neck will be ignored
        if voxgroup != '' and model['regions'][model['grid'][voxnum]['region']]==spinename:
            spinelist.append(voxgroup)
            spinelist_vox.append(voxnum)
    #create a unique set of spine labels
    newspinelist=np.unique(spinelist)
    newspinevox={}
    #identify which voxels go with which spine labels
    for spine in newspinelist:
        temp=[]
        spinevol=0
        for el,sp in enumerate(spinelist):
            if sp==spine:
                temp.append(spinelist_vox[el])
                #calculate volume of each spine.
                spinevol+=model['grid'][spinelist_vox[el]]['volume']
        newspinevox[spine]={'vox':temp,'vol':spinevol}
    #Need to do better job of sorting spines than this OrderedDict
    return newspinelist,OrderedDict(sorted(newspinevox.items(), key=lambda t: t[0]))

def region_means_dict(data,regionDict,time,molecule,trials):
    RegionMeans=np.zeros((len(trials),len(time),len(regionDict)))
    header=''       #Header for output file
    for j,item in enumerate(regionDict):
        RegionMeans[:,:,j]=np.sum(data[:,:,regionDict[item]['vox']],axis=2)/(regionDict[item]['vol']*mol_per_nM_u3)
        header=header+molecule+'_'+item+' '       #Header for output file
    RegionMeanStd={}
    if len(trials)>1:
        RegionMeanStd['mean']=np.mean(RegionMeans,axis=0)
        RegionMeanStd['std']=np.std(RegionMeans,axis=0)
    return header,RegionMeans,RegionMeanStd
    
 
