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


#stimulate 1 spine, evaluate dendritic signature vs spine, and spatial specificity
#Then, stimulate 2 spines, either adjacent or separated - how does dendritie signature change?
#For two spines: duplicate the spine injections, with second spine being either 1 or 7
#With calcium from genesis model, will need to match glu stim of spines, perhaps get genesis output of glu - i.e., select among 2 or 4 spines for each inject?
#Not sure how to adapt dopamine and ACh, which is non-synaptic
#Other sims expers: calcium from Da depleted case, or change molecules and calcium according to alcohol effects
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar Model_SPNspine_noATP-nostim.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar Model_SPNspineAChm4R_Gshydr5_GapD-nostim.xml 

java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-bathDa.xml 323/Model_SPNspineAChm4R_Gshydr5_GapD-bathDa_pD1RGs &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-noReb_DaDec1.xml 323/Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-noReb_DaDec1_pD1RGs &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-blockM1.xml 323/Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-blockM1 &

java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspine_noATP-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-noReb_DaDec1_noATP.xml 323/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspine_noATP-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-bathDa_noATP.xml 323/ &

#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stim20hz-alcIC.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stim20hz-alcNMDA.xml
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stim20hz-alcNMDA_IC.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stimtheta-alcNMDA_IC.xml
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stimtheta-alcIC.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stimtheta-alcNMDA.xml
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stimtheta-alcCtrl.xml
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stim20hz-alcCtrl.xml

#New PDE2
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-bathCa.xml 323/ 
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-bathDaCa.xml 323/ &
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 -Dneurord.SDRun.tolerance=0.005 Model_SPNspineAChm4R_Gshydr5_GapD-bathCa.xml 323/Model_SPNspineAChm4R_Gshydr5_GapD-bathCa-tol005

#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 -Dneurord.SDRun.tolerance=0.005 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-noReb_DaDec1.xml 323/Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-noReb_DaDec1tol005 &
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-noReb_lowDaDec2.xml 323/&
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-noReb_lowDaDec3.xml 323/
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 -Dneurord.SDRun.tolerance=0.005 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-noReb_lowDaDec3.xml 323/Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-noReb_lowDaDec3tol005 &

#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 -Dneurord.SDRun.tolerance=0.005 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca5s-dhpg0.xml 323/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi_tol005-Ca5s-dhpg0 &
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca5s-dhpg0.xml 323/ &
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca5s-dhpg1.xml 323/ 
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca5s-dhpg25.xml 323/ &
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca5s-dhpg5.xml 323/  &
#java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 -Dneurord.SDRun.tolerance=0.005 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca5s-dhpg25.xml 323/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi_tol005-Ca5s-dhpg25 

