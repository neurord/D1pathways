from __future__ import print_function
from __future__ import division
#This calculates area under the curve for the DSI simulations for two or more molecule species.
#Edit the mollist varable if other molecules are of interest
#Present, it only evaluates the mean value (averaged over the entire morphology), but can also process other
# column by specifying a list of columns for meancol variable.
#This calculates the ratio of the results with respect to the 0dhpg condition specified in dhpgconc
#The input file is output from NRDPostAB or neurord_analysis.py to calculate region averages of a single molecule species.
#input argument is list of root filenames
import os
from numpy import *
from pylab import *
import sys

#give basic information such as directory, root name of the files, and list of molecules to be processed:

suffix="_avg.txt"
duration=['100ms','1s','5s']
dhpgconc=['-dhpg0', '-dhpg1','-dhpg5','-dhpg25']

#This list of molecules can be of arbitrary length.  
mollist=['PkcCaDag', '2ag']   

#which columns of data do you want to process, e.g. submemb, etc.
#the last value will be replaced by 2nd to last column below.
meancol=[12]
#key times in seconds
basalstime=15
basaltime=20
stimtime=22
endtime=50

try:
	args = ARGS.split(",")
	print("ARGS =", ARGS, "commandline=", args)
 	do_exit = False
except NameError: #NameError refers to an undefined variable (in this case ARGS)
	args = sys.argv[1:]
	print("commandline =", args)
	do_exit = True

#*************Use assignments above to sum corresponding columns in files *******************
#this loop assigns the filenames
for filenm in range(len(args)):
    for mol in mollist:
        auc=zeros((len(dhpgconc),len(duration)))
        ratio=zeros((len(dhpgconc)-1,len(duration)))
        for dhpg in range(len(dhpgconc)):
            for dur in range(len(duration)):
                fullfilename=args[filenm]+duration[dur]+dhpgconc[dhpg]+'-all-conc'+mol+suffix
                
#this loop reads in the data arrays and adds them together
                data=loadtxt(fullfilename,skiprows=1)
                print(fullfilename,data.shape)
                
#make sure the second to last column is identified, and extract the time column
                meancol=data.shape[1]-1
                time=data[:,0]
                
#calculate area under the curve from the beginning of stimulation through when the response returns to basal.
                dt=time[1]-time[0]
                basalstart=basalstime/dt
                basalend=basaltime/dt
                stimsample=stimtime/dt
                endsample=min(len(time),endtime/dt)
                auc[dhpg,dur]=(data[stimsample:endsample,meancol].mean()-data[basalstart:basalend,meancol].mean())
        #End of first for dhpg and for dur loop
        print("AUC for", mol, "\n",auc)
        for dhpg in range(1,len(dhpgconc)):
            for dur in range(len(duration)):
                #print "auc calc", dhpg, dhpgconc[dhpg], "dur=", dur
                #print ratio
                ratio[dhpg-1,dur]=auc[dhpg,dur]/auc[0,dur]

#	outdata=column_stack((time, headstimdata, newdata[:,meancol]))

        outfname=args[filenm]+mol+'-auc.txt'
        print(outfname)
        savetxt(outfname, auc, fmt='%.4f', delimiter=' ')
        outfname=args[filenm]+mol+'-ratio.txt'
        savetxt(outfname, ratio, fmt='%.4f', delimiter=' ')

