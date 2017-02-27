from __future__ import print_function
from __future__ import division
import numpy as np
from matplotlib import pyplot

textsize=10
legtextsize=8

def plot_setup(plot_molecules,param_list,param_name):
     pyplot.ion()
     if len(plot_molecules)>8:
          rows=int(np.round(np.sqrt(len(plot_molecules))))
          cols=int(np.ceil(len(plot_molecules)/float(rows)))
     else:
          cols=1
          rows=len(plot_molecules)
     fig,axes=pyplot.subplots(rows, cols,sharex=True) #n rows,  1 column
     col_inc=[0.5,0.5]
     scale=['lin','lin']
     numpar=[0,0]
     for i,paramset in enumerate(param_list):
          numpar=len(paramset)
          if numpar>1:
               col_inc[i]=1.0/len(paramset)
               print("plot_setup: col_inc,scale=",col_inc, scale)
     return fig,col_inc,scale,numpar

def plottrace(plotmol,time,plotarray,parval,fig,colinc,scale,parlist):
     print("plottrace: plotmol,parval,parlist:", plotmol,parval, parlist)
     axis=fig.axes
     for pnum in range(len(parval)):
          #First, determine the color scaleing
          if len(parlist)==0:
               p0=p1=0
          else:
               if np.shape(parlist[1])[0]==0:
                    p0=parlist[0].index(parval[pnum])
                    p1=0
               elif np.shape(parlist[0])[0]==0:
                    p1=parlist[1].index(parval[pnum])
                    p0=0
               else:
                    p0=parlist[0].index(parval[pnum][0])
                    p1=parlist[1].index(parval[pnum][1])
          #Second, plot each molecule
          for imol in range(len(plotmol)):
               axis[imol].plot(time[imol][:],plotarray[imol][pnum][:],label=parval[pnum],color=(p0*colinc[0],0,p1*colinc[1]))
               axis[imol].set_ylabel(plotmol[imol]+' (nM)',fontsize=textsize)
          axis[imol].set_xlabel('Time (sec)',fontsize=textsize)
          axis[0].legend(fontsize=legtextsize, loc='best')
     fig.canvas.draw()
     return

def plotss(plot_mol,xparval,ss):
    fig,axes=pyplot.subplots(len(plot_mol), 1,sharex=True)
    for imol,mol in enumerate(plot_mol):
        axes[imol].plot(xparval,ss[:,imol],'o',label=mol)
        axes[imol].set_ylabel('nM')
        if max(xparval)/min(xparval)>100:
            axes[imol].set_xscale("log")
        axes[imol].legend(fontsize=legtextsize, loc='best')
    fig.canvas.draw()
    return

def plot_signature(condition,traces,time,title):
     if len(np.shape(traces))==3:
          numrows=np.shape(traces)[2]
     else:
          numrows=1
     fig,axes=pyplot.subplots(numrows,1,sharex=True)
     if numrows==1:
          for i,cond in enumerate(condition):
               axes.plot(time,traces[i],label=cond)
               axes.legend(fontsize=legtextsize, loc='best')
               axes.set_ylabel('signature (nM) ',fontsize=textsize)
               axes.set_xlabel('Time (sec)',fontsize=textsize)
     else:
          domain=[]
          for j in range(numrows):
               domain.append(condition[0][j].split()[-1])
               for i,cond in enumerate(condition):
                    axes[j].plot(time,traces[i,:,j],label=cond[j].split()[0:3])
               axes[j].legend(fontsize=legtextsize, loc='best')
               axes[j].set_ylabel(domain[j],fontsize=textsize)
          axes[numrows-1].set_xlabel('Time (sec)',fontsize=textsize)
     fig.suptitle(title)
     fig.canvas.draw()
     return

#The files are sorted on the parameters, assumes no hyphens in root filename
def file_tuple(fnames,params):
     ftuple=[]
     par0list=[]
     par1list=[]
     print('pu: ',params, fnames)
     for fname in fnames:
          dotloc=fname.rfind('.')
          part_fname=fname[0:dotloc].split('-'+params[0])[-1] 
          hyphen=part_fname.find('-')
          if hyphen>-1:
               parval0=part_fname[0:hyphen]
          else:
               parval0=part_fname 
          if (parval0 not in par0list):
               par0list.append(parval0)
          print('pu: fname, par0:',fname,par0list)
          if len(params)>1:
               parval1=part_fname.split('-'+params[1])[-1] 
               ftuple.append((fname,(parval0,parval1)))
               if (parval1 not in par1list):
                    par1list.append(parval1)
               print('pu: par1:',par1list)
          else:
               ftuple.append((fname,parval0))
     return ftuple,[par0list,par1list]

