from __future__ import print_function
from __future__ import division
import numpy as np
from matplotlib import pyplot

legtextsize=10
     
colors=pyplot.get_cmap('viridis')
#colors=pyplot.get_cmap('plasma')
colors2D=[pyplot.get_cmap('gist_heat'),pyplot.get_cmap('summer'),pyplot.get_cmap('Blues')]
offset=[0,0,63]  #avoid the light colors in low indices for the 'Blues' map
partial_scale=0.75 #avoid the very light colors.  Note that non-zero offset must be <= (1-partial_scale)*255

def plot_setup(plot_molecules,param_list,param_name):
     pyplot.ion()
     if len(plot_molecules)>8:
          rows=int(np.round(np.sqrt(len(plot_molecules))))
          cols=int(np.ceil(len(plot_molecules)/float(rows)))
     else:
          cols=1
          rows=len(plot_molecules)
     fig,axes=pyplot.subplots(rows, cols,sharex=True) #n rows,  1 column #,figsize=(4*cols,rows)
     col_inc=[0.0,0.0]
     scale=['lin','lin']
     for i,paramset in enumerate(param_list):
          if len(paramset)>1:
               col_inc[i]=(len(colors.colors)-1)/(len(paramset)-1)
          else:
               col_inc[i]=0.0
     return fig,col_inc,scale

def plottrace(plotmol,time,plotarray,parval,fig,colinc,scale,parlist,textsize):
     print("plottrace: plotmol,parval,parlist:", plotmol,parval, parlist)
     axis=fig.axes  #increments col index 1st
     for pnum in range(len(parval)):
          #First, determine the color scaling
          if len(parlist)==0:
               mycolor=[0,0,0]
          else:
               if np.shape(parlist[1])[0]==0:
                    color_index=int(parlist[0].index(parval[pnum])*colinc[0]*partial_scale)
                    mycolor=colors.colors[color_index]
               elif np.shape(parlist[0])[0]==0:
                    color_index=int(parlist[1].index(parval[pnum])*colinc[1]*partial_scale)
                    mycolor=colors.colors[color_index]
               else:
                    if len(parlist[1])<len(parlist[0]):
                         map_index=parlist[1].index(parval[pnum][1])
                         color_index=int(parlist[0].index(parval[pnum][0])*colinc[0]*partial_scale)
                    else:
                         map_index=parlist[0].index(parval[pnum][0])
                         color_index=int(parlist[1].index(parval[pnum][1])*colinc[1]*partial_scale)
                    mycolor=colors2D[map_index].__call__(color_index+offset[map_index])
          #Second, plot each molecule
          for imol in range(len(plotmol)):
               #axis[imol].autoscale(enable=True,tight=False)
               #change label back to parval[pnum] after figures created
               axis[imol].plot(time[imol][:],plotarray[imol][pnum][:],label=parval[pnum],color=mycolor)
               axis[imol].set_ylabel(plotmol[imol]+' (nM)',fontsize=textsize)
               axis[imol].tick_params(labelsize=textsize)
          axis[imol].set_xlabel('Time (sec)',fontsize=textsize)
     axis[0].legend(fontsize=legtextsize, loc='upper left')
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

def plot_signature(condition,traces,time,figtitle,sign_title,textsize,thresholds,moretraces=[]):
     if len(moretraces):
          plot_ltd=1
     else:
          plot_ltd=0
     if len(np.shape(traces))==3:
          numrows=np.shape(traces)[2]
     else:
          numrows=1
     if len(moretraces):
          numcols=2
     else:
          numcols=1
     fig,axes=pyplot.subplots(numrows,numcols,sharex=True,figsize=(4,3))
     axis=fig.axes
     if numrows==1:
          if len(condition)>1:
               colinc=len(colors)/(len(condition)-1)
          else:
               colinc=0
          for i,cond in enumerate(condition):
               numpoints=np.shape(traces[i])[0]
               newtime = np.linspace(0,time[1]*(numpoints-1), numpoints+1)
               axis[0].plot(newtime,traces[i],label=cond,color=colors[int(i*colinc)])
               axis[0].legend(fontsize=legtextsize, loc='best')
               axis[0].set_ylabel('LTP sig (nM) ',fontsize=textsize)
               axis[0].set_xlabel('Time (sec)',fontsize=textsize)
               axis[0].tick_params(labelsize=textsize)
               if plot_ltd:
                    axis[1].plot(newtime,moretraces[i],color=colors[int(i*colinc)])
                    axis[1].set_ylabel('LTD sig (nM) ',fontsize=textsize)
                    axis[1].set_xlabel('Time (sec)',fontsize=textsize)
     else:
          domain=[]
          for row,j in enumerate(range(0,numrows*numcols,numcols)):
               #thresh_index=np.ceil(row/numrows)
               domain.append(condition[0][row].split()[-1])
               num_par=len(condition)/2
               for i,cond in enumerate(condition):
                    #the following assumes that first parameter has only two values
                    map_index=int( i/num_par )
                    color_index=int( i%num_par *(255/num_par) )
                    numpoints=np.shape(traces[i])[0]
                    newtime = np.linspace(0,time[1]*(numpoints-1), numpoints)
                    if j==0:
                         axis[j].plot(newtime,traces[i,:,row],label=cond[row].split()[0:-1],color=colors2D[map_index].__call__(color_index))
                    else:
                         axis[j].plot(newtime,traces[i,:,row],color=colors2D[map_index].__call__(color_index))
                    axis[0].legend(fontsize=legtextsize, loc='lower right')
                    if plot_ltd:
                         axis[j+1].plot(newtime,moretraces[i,:,row],color=colors2D[map_index].__call__(color_index))
               axis[j].set_ylabel(domain[row],fontsize=textsize)
               axis[j].tick_params(labelsize=textsize)
               #fix this threshold plot to work with multiple spines: thresh[1]->row=1:spines, thresh[3]-> row=1:spines
               #print("j", j, "row", row, thresholds[row])
               axis[j].plot([0,newtime[-1]],[thresholds[row],thresholds[row]],color='k',linestyle= 'dashed')
               if plot_ltd:
                    #print("j+1", j+1, "row", row, "row+nc", row+numcols, thresholds[row+numcols])
                    axis[j+1].plot([0,newtime[-1]],[thresholds[row+numcols],thresholds[row+numcols]],color='k',linestyle= 'dashed')
          if plot_ltd:
               axis[len(axis)-1].set_xlabel('Time (sec) LTD',fontsize=textsize)
               axis[len(axis)-2].set_xlabel('Time (sec) LTP',fontsize=textsize)
          else:
               axis[len(axis)-1].set_xlabel('Time (sec)',fontsize=textsize)
     fig.canvas.set_window_title(figtitle)
     fig.suptitle(sign_title)
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

def tweak_fig(fig,yrange,legendloc,legendaxis,legtextsize):
     axes=fig.axes
     for axis in axes:
          axis.set_ylim(yrange)
          axis.set_ylim(yrange)
          axes[legendaxis].legend(fontsize=legtextsize, loc=legendloc)
     fig.tight_layout()

def axis_config(ax):
    ax.spines['right'].set_visible(False)
    ax.spines['top'].set_visible(False)
    ax.get_xaxis().set_tick_params(direction='out', right=0, which='both')
    ax.get_yaxis().set_tick_params(direction='out', top=0, which='both')

def axlabel(ax, label):
    ax.text(-0.2, 1.05, label, transform=ax.transAxes,
            fontweight='bold', va='top', ha='right')   

#from matplotlib.ticker import FuncFormatter
#def other_stuff():
     #PercentFormatter = FuncFormatter(lambda x, pos: '{:.0%}'.format(x).replace('%', r'\%'))
     #plt.rc('text', usetex=1)
     #plt.rc('text.latex', unicode=1)
     #plt.rc('font', weight='bold')
     #plt.rc('xtick', labelsize=20)
     #plt.rc('ytick', labelsize=20)
     #plt.rc('axes', labelsize=25)
     #plt.rc('axes', labelweight='bold')
     #plt.rc('legend', frameon=False)
     #plt.rc('legend', fontsize=20)
     #plt.rc('figure.subplot', bottom=0.15, left=0.18, right=0.93, top=0.93)
     #plt.rc('axes', color_cycle=['r', 'g', 'b', 'c', 'm', 'k', 'y'])
     #plt.rc('legend', numpoints=1)
     #matplotlib.rc('axes.formatter', useoffset=False)
