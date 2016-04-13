import numpy as np
from string import *
import glob
import os
import plot_h5 as pu
Avogadro=6.023e14 #to convert to nanoMoles
mol_per_nM_u3=Avogadro*1e-15

def get_mol_info(simData,plot_molecules,gridpoints):
    outputsets=simData['model']['output'].keys()
    dt=np.zeros((len(plot_molecules)))
    samples=np.zeros((len(plot_molecules)),dtype=int)
    out_location={}
    for imol,molecule in enumerate(plot_molecules):
        temp_dict={}
        tot_voxels=0
        for outset in outputsets[1:]:           #better to go backward from last set, and then go to 0 set if mol not found
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
            print "************* MOLECULE NOT IN REGULAR OUTPUT SETS !!!!!!!!!!!!"
            mol_index=get_mol_index(simData,outset,molecule)
            if mol_index>-1:
                samples[imol]=len(simData['trial0']['output'][outset]['times'])
                dt[imol]=simData['trial0']['output'][outset]['times'][1]/1000. #convert msec to sec
                temp_dict[outset]={'mol_index':mol_index,'elements':simData['model']['output'][outset]['elements'][:]}
                out_location[molecule]={'samples':samples[imol],'dt':dt[imol],'voxels': grid_points,'location': temp_dict}
            else:
                out_location[molecule]=-1
                print "************* MOLECULE DOES NOT EXIST !!!!!!!!!!!!"
    return out_location,dt,samples
         
def get_mol_index(simData,outputset,molecule):
    indices=np.where(simData['model']['output'][outputset]['species'][:]==molecule)[0]
    if len(indices) == 1:
        return indices[0]
    else:
        return -1

def get_mol_pop(simData, out_location,gridpoints):
    samples=out_location['samples']
    conc=np.zeros((samples,gridpoints))
    for outset in out_location['location'].keys():
        elements=out_location['location'][outset]['elements']
        tempConc=simData['trial0']['output'][outset]['population'][:,:,out_location['location'][outset]['mol_index']]
        time=simData['trial0']['output'][outset]['times'][:]/1000.     #Convert msec to sec
        conc[:,elements]=tempConc
    return conc,time

def argparse(args):

    def sortorder(ftuple):
        ans = ftuple[1]
        #print 'sort', ftuple, '->', ans
        return ans

    #1st and 2nd arguements used to construct pattern for reading in multiple files
    pattern=args[2]+'*'
    if len(args[0]):
        params=args[0].split(" ")
        for par in params:
            pattern=pattern+'-'+par+'*'
    else:
        params=[]
    print "pattern", pattern
    whole_pattern=pattern+'.h5'

    lastslash=str.rfind(pattern,'/')
    subdir=pattern[0:lastslash]

    fnames = glob.glob(whole_pattern)
    print "NUM FILES:", len(fnames), "CURRENT DIRECTORY:", os.getcwd(), ", Target directory:", subdir
    if len(fnames)==0:
        print "FILES:", os.listdir(subdir+'/'+'*.h5')
        #exit program

    parlist=[]
    if len(args[0]):
        ftuples,parlist=pu.file_tuple(fnames,params)
        ftuples = sorted(ftuples, key=lambda x:x[1])
    else:
        ftuples=[(fnames[0],1)]
    return ftuples,parlist,params


def region_volume(List,Vox,volume,prnvox):
    #This volume is in units of cubic microns, multiply by 1e-15 to convert to Liters
    print "\nFOR region avg: j,regionvox,vol:"
    region_volume=np.zeros(len(List))
    for j in range(len(List)):
        for k in Vox[j]:
            region_volume[j]+=volume[k] 
        if prnvox:
            print j, List[j],Vox[j],region_volume[j]
        else:
            print "not printed"
    return region_volume

def subvol_list(structType,model):
    #better to use dictionaries with region_list or reg_struct_list the keys.
    #Will need to change region_means for dictionary compatibility
    region_list=model['regions']
    region_voxels=[]
    for region in region_list:
        region_voxels.append([])
    for elnum,element in enumerate(model['grid']):
        region_voxels[element['region']].append(elnum) 
    region_struct_vox=[]
    reg_struct_list=[]
    reg_struct_deltaY=[]
    totnum=0
    for setnum,voxel_set in enumerate(region_voxels):
        if len(voxel_set)>1:
            struct_set=model['grid'][voxel_set]['type']
            if list(struct_set).count(struct_set[0])<len(struct_set):
                region_struct_vox.append(list(np.where(struct_set==struct_set[0])[0]))
                region_struct_vox.append(list(np.where(struct_set!=struct_set[0])[0]))
                reg_struct_list.append(model['regions'][setnum]+structType[region_struct_vox[0+totnum][0]][0:3])
                reg_struct_list.append(model['regions'][setnum]+structType[region_struct_vox[1+totnum][0]][0:3])
                reg_struct_deltaY.append(model['grid'][region_struct_vox[0+totnum][0]]['y0']-model['grid'][region_struct_vox[0+totnum][0]]['y2'])
                reg_struct_deltaY.append(model['grid'][region_struct_vox[1+totnum][0]]['y0']-model['grid'][region_struct_vox[1+totnum][0]]['y2'])
                totnum=totnum+2
    return region_list,region_voxels,reg_struct_list,region_struct_vox,reg_struct_deltaY

def region_means(data,regionList,regionCol,regionVol,time,molecule):
    RegionMeans=np.zeros((len(time),len(regionList)))
    header=''       #Header for output file
    for itime in range(len(time)):
        for j in range(len(regionList)):
            for k in regionCol[j]:
                RegionMeans[itime,j]+=data[itime,k]

    for j in range(len(regionList)):
        RegionMeans[:,j]/=(regionVol[j]*mol_per_nM_u3)
        #print "head",header,"mol",molecule,"reg",regionList[j]
        header=header+molecule+regionList[j]+' '       #Header for output file
    return header,RegionMeans

 
 
