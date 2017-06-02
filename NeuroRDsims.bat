 #Always run NeuroRD with the following command line, to direct output into the o utput directory.
 #To start multiple NeuroRD simulations at once, add & at end of each line.
 #run the batch file using: at -f NeuroRD.bat NOW (or you can specify a different time)
#place the following at the top of the file to get additional output
#set -ex

#First line will elminate output, 
#java -Dstochdiff.writers= -jar stochdiff
#Alternatively, can get only h5, only text, or both
#-Dstochdiff.writers=h5
#-Dstochdiff.writers=text
#-Dstochdiff.writers=text,h5

#To avoid information scrolling on screen (and not getting a huge .log file):
#> /dev/null 

#To run things in parallel (instead of batch file):
#parallel --gnu java -Dstochdiff.writers=text -Dstochdiff.log=false -jar /home/neuroware/stochdif/stochdiff-3.0.0-1.jar ::: Model_cAMPassaySoma*.xml

#result: ran very fast: 3 min for 9 voxel model (2.1.9 required 33 min)

#ptdump to look at h5 file.
#-Dneurord.writers=h5,text for text output
#-Dneurord.trials=3 specify number of trials
#-Dneurord.threads=1 to use a single processor for multiple trials.  Omit to run in parallel
# other switches have to come after the jar file specification
# -v to get more information (but not too much) in log (eventually including number of particles injected for each type), -vv to get way too much information
#-Dneurord.SDRun.runtime=1 will override the runtime in the Model file
# --ic-time -1 --ic ss_bath/Model_SPNspineCaMKII_DagL_AChm4R-nostim.h5 Specify file from which to obtain initial conditions (for re-start), specify time to take IC.
#java -jar -Dneurord.writers=h5  /home/neuroware/stochdif/neurord-3.1.2.jar -Dneurord.SDRun.runtime=1 -v Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-nostim.xml#This will be useful to avoid awkward updating of initial conditions, or to have very little initial simulation time for equilibrium
#Unknown how this command will work with multi-trial h5 files

#ls UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca*.xml |xargs sed -i s/"<runtime>          100000"/"<runtime>          150000"/g

#stimulate 1 spine, evaluate dendritic signature vs spine, and spatial specificity

#bath, block and bath-block (set1)
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-bathDa.xml ss_bath/ &
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-bathCa.xml ss_bath/ &
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-bathDaCa.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-noACh.xml ss_bath/ &

java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-BlockOA-bathCa.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-BlockCyA-bathCa.xml ss_bath/ &

#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-blockCyA.xml ss_bath/ &
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-blockOA.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-blockPap.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-blockRoli.xml ss_bath/ 

#Da dur (set2) 
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-Da0.1.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-Da0.3.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-Da1.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-Da10.xml ss_bath/ 

#Uchi: set3 - 24hrs for all 3 (only 150s each)
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca100m-dhpg25.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca100m-dhpg0.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca100m-dhpg1.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca100m-dhpg5.xml UchiNew/ 

java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca1s-dhpg25.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca1s-dhpg5.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca1s-dhpg0.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca1s-dhpg1.xml UchiNew/ 

java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca5s-dhpg0.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca5s-dhpg1.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca5s-dhpg25.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca5s-dhpg5.xml UchiNew/  



