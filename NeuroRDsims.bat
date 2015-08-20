 #Always run NeuroRD with the following command line, to direct output into the o utput directory.
 #To start multiple NeuroRD simulations at once, add & at end of each line.
 #run the batch file using: at -f NeuroRD.bat NOW (or you can specify a different time)
#place the following at the top of the file to get additional output
set -ex

#First line will elminate output, 
java -Dstochdiff.writers= -jar stochdiff
#Alternatively, can get only h5, only text, or both
-Dstochdiff.writers=h5
-Dstochdiff.writers=text
-Dstochdiff.writers=text,h5

#To avoid information scrolling on screen (and not getting a huge .log file):
> /dev/null 


To run things in parallel (instead of batch file):
parallel --gnu java -Dstochdiff.writers=text -jar /home/neuroware/stochdif/stochdiff-3.0.0-1.jar ::: Model_cAMPassaySoma*.xml

result: ran very fast: 3 min for 9 voxel model (2.1.9 required 33 min)

