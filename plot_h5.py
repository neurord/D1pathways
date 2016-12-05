from __future__ import print_function
from __future__ import division
import numpy as np
from matplotlib import pyplot

def plot_setup(plot_molecules,param_list,param_name):
     pyplot.ion()
     if len(plot_molecules)>10:
          rows=int(np.sqrt(len(plot_molecules)))+1
          cols=len(plot_molecules)//(rows-1)
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
     return fig,axes,col_inc,scale,numpar

def plottrace(plotmol,time,plotarray,parval,axes,fig,colinc,scale,parlist):
     print("plottrace: plotmol,parval,parlist:", plotmol,parval, parlist)
     for pnum in range(len(parval)):
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
               if not np.shape(axes):
                    imol=0
                    axes.plot(time[imol][:],plotarray[imol][pnum][:],label=parval[pnum],color=(p0*colinc[0],0,p1*colinc[1]))
                    axes.set_xlabel('Time (sec)')
                    axes.set_ylabel(plotmol[imol])
               else:
                    rows=np.shape(axes)[0]
                    if np.size(axes)==rows:
                         for imol in range(len(plotmol)):
                              if plotarray[imol][pnum][0]>-1:
                                   axes[imol].plot(time[imol][:],plotarray[imol][pnum][:],label=parval[pnum],color=(p0*colinc[0],0,p1*colinc[1]))
                              axes[imol].set_ylabel(plotmol[imol]+' (nM)')
                         axes[len(plotmol)-1].set_xlabel('Time (sec)')
                         axes[0].legend(fontsize=8, loc='best')
                    else:
                         cols=np.shape(axes)[1]
                         for col in range(cols):
                              for row in range(rows):
                                   imol=row+rows*col
                                   if imol<len(plotmol) and plotarray[imol][pnum][0]>-1:
                                        axes[row,col].plot(time[imol][:],plotarray[imol][pnum][:],label=parval[pnum],color=(p0*colinc[0],0,p1*colinc[1]))
                                        axes[row,col].set_ylabel(plotmol[imol])#+' (nM)')
                              axes[rows-1,col].set_xlabel('Time (sec)')
                         axes[0,0].legend(fontsize=8, loc='best')
     fig.canvas.draw()
     return

def plotss(plot_mol,xparval,ss):
    fig,axes=pyplot.subplots(len(plot_mol), 1,sharex=True)
    for imol,mol in enumerate(plot_mol):
        axes[imol].plot(xparval,ss[:,imol],'o',label=mol)
        axes[imol].set_ylabel('nM')
        if max(xparval)/min(xparval)>100:
            axes[imol].set_xscale("log")
        axes[imol].legend(fontsize=8, loc='best')
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
               axes.legend(fontsize=8, loc='best')
               axes.set_ylabel('signature (nM) ')
               axes.set_xlabel('Time (sec)')
     else:
          domain=[]
          for j in range(numrows):
               domain.append(condition[0][j].split()[-1])
               for i,cond in enumerate(condition):
                    axes[j].plot(time,traces[i,:,j],label=cond[j].split()[0:3])
               axes[j].legend(fontsize=8, loc='best')
               axes[j].set_ylabel('signature (nM) '+domain[j])
          axes[numrows-1].set_xlabel('Time (sec)')
     fig.suptitle(title)
     fig.canvas.draw()
     return

#The files are sorted on the parameters, assumes no hyphens in root filename
def file_tuple(fnames,params):
     ftuple=[]
     par0list=[]
     par1list=[]
     for fname in fnames:
          dotloc=fname.rfind('.')
          lasthyphen=fname.rfind('-')
          parval0=fname[lasthyphen:dotloc].split(params[-1])[1]
          if (parval0 not in par0list):
               par0list.append(parval0)
          print('pu: fname, par0:',fname,par0list)
          if len(params)>1:
               hyphen=fname[0:lasthyphen].rfind('-')
               parval1=fname[hyphen:lasthyphen].split(params[0])[1]
               ftuple.append((fname,(parval1,parval0)))
               if (parval1 not in par1list):
                    par1list.append(parval1)
               print('pu: par1:',par1list)
          else:
               ftuple.append((fname,parval0))
     if len(par1list):
          print (par0list,par1list)
          temp=par1list
          par1list=par0list
          par0list=temp
          print (par0list,par1list)
     return ftuple,[par0list,par1list]

