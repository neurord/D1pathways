import numpy as np
from matplotlib import pyplot

def plot_setup(plot_molecules,param_list,param_name):
     pyplot.ion()
     if len(plot_molecules)>10:
          rows=int(np.sqrt(len(plot_molecules)))+1
          cols=len(plot_molecules)/(rows-1)
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
               col_inc[i]=1.0/(len(paramset))
               print "plot_setup: col_inc,scale=",col_inc, scale
     return fig,axes,col_inc,scale,numpar

def plottrace(plotmol,time,plotarray,parval,axes,fig,colinc,scale,parlist):
     print "plottrace: plotmol,parval,parlist:", plotmol,parval, parlist
     if len(parlist)==0:
          p0=p1=0
     else:
          if np.shape(parlist[1])[0]==0:
               p0=parlist[0].index(parval)
               p1=0
          elif np.shape(parlist[0])[0]==0:
               p1=parlist[1].index(parval)
               p0=0
          else:
               p0=parlist[0].index(parval[0])
               p1=parlist[1].index(parval[1])
     rows=np.shape(axes)[0]
     if np.size(axes)==rows:
          for imol in range(len(plotmol)):
               if plotarray[imol][0]>-1:
                    axes[imol].plot(time[imol][:],plotarray[imol][:],label=parval,color=(p0*colinc[0],0,p1*colinc[1]))
               if imol==0:
                    axes[imol].legend(fontsize=8, loc='best')
               axes[imol].set_ylabel(plotmol[imol])#+' (nM)')
          axes[imol].set_xlabel('Time (sec)')
     else:
          cols=np.shape(axes)[1]
          for col in range(cols):
               for row in range(rows):
                    imol=row+rows*col
                    if imol<len(plotmol) and plotarray[imol][0]>-1:
                         axes[row,col].plot(time[imol][:],plotarray[imol][:],label=parval,color=(p0*colinc[0],0,p1*colinc[1]))
                    if imol==0:
                         axes[row,col].legend(fontsize=8, loc='best')
                    axes[row,col].set_ylabel(plotmol[imol])#+' (nM)')
               axes[rows-1,col].set_xlabel('Time (sec)')
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

#The files are sorted on the parameters, assumes no hyphens in root filename
def file_tuple(fnames,params):
     ftuple=[]
     par0list=[]
     par1list=[]
     for fname in fnames:
            parts=fname.split('-')
            parval0=parts[1].split(params[0])[1]
            dotloc= parval0.find('.')
            if dotloc>0:
                 parval0=parval0[0:dotloc]
            if (parval0 not in par0list):
                 par0list.append(parval0)
            print 'pu: fname, par0:',fname,par0list
            if len(params)>1:
                    parval1=parts[2].split(params[1])[1]
                    dotloc= parval1.find('.')
                    if dotloc>0:
                         parval1=parval1[0:dotloc]
                    ftuple.append((fname,(parval0,parval1)))
                    if (parval1 not in par1list):
                         par1list.append(parval1)
                    print 'pu: par1:',par1list
            else:
                    ftuple.append((fname,parval0))
     return ftuple,[par0list,par1list]

