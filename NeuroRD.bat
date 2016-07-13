#Always run NeuroRD with the following command line, to direct output into the output directory.
#To start multiple NeuroRD simulations at once, add & at end of each line.
#run the batch file using: at -f NeuroRD.bat NOW (or you can specify a different time)
set -ex

#stimulate 1 spine, evaluate dendritic signature vs spine, and spatial specificity
#Then, stimulate 2 spines, either adjacent or separated - how does dendritie signature change?
#For two spines: duplicate the spine injections, with second spine being either 1 or 7
#With calcium from genesis model, will need to match glu stim of spines, perhaps get genesis output of glu - i.e., select among 2 or 4 spines for each inject?
#Not sure how to adapt dopamine and ACh, which is non-synaptic
#Other sims expers: calcium from Da depleted case, or change molecules and calcium according to alcohol effects
#java -ea -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R_20um-sp1-stim20hz.xml &
#java -ea -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R_20um-sp1-stimtheta.xml &

#java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R_20um-sp2adj-stim20hz.xml &
#java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R_20um-sp2sep-stim20hz.xml &
#java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R_20um-sp2adj-stimtheta.xml &
#java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R_20um-sp2sep-stimtheta.xml &

#java -ea -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R-stim20hz.xml &
#java -ea -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R-stimtheta.xml &

#java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.2.jar  Model_SPNspineCaMKII_DagL_AChm4R-Da0.1.xml ss_bath/  &
#java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.2.jar  Model_SPNspineCaMKII_DagL_AChm4R-Da0.3.xml ss_bath/  &
#java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.2.jar  Model_SPNspineCaMKII_DagL_AChm4R-Da1.xml ss_bath/ &
#java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.2.jar  Model_SPNspineCaMKII_DagL_AChm4R-Da100.xml ss_bath/ 

#adjust Gs stuff so that noACh doesn't have super high cAMP signal
#java -jar -Dneurord.writers=h5 -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R-noACh.xml ss_bath/ &
#java -jar -Dneurord.writers=h5 -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R-nostim.xml ss_bath/ &
#java -jar -Dneurord.writers=h5 -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R_PKAfast-nostim.xml ss_bath/ 
#java -jar -Dneurord.writers=h5 -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5-nostim.xml ss_bath/ &
#java -jar -Dneurord.writers=h5 -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5-noACh.xml ss_bath/ &
#java -jar /home/neuroware/stochdif/neurord-3.1.1.jar -Dneurord.writers=h5 --ic-time -1 --ic ss_bath/Model_SPNspineCaMKII_DagL_AChm4R-nostim.h5 Model_SPNspineCaMKII_DagL_AChm4R-nostim.xml ss_bath/Model_SPNspineCaMKII_DagL_AChm4R-nostimrestart
#NOTE, restart uses the low frequeny output in __main__

#java -jar -Dneurord.writers=h5 -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R-bathDa.xml ss_bath/ &
#java -jar -Dneurord.writers=h5 -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R-bathCa.xml ss_bath/ &
#java -jar -Dneurord.writers=h5 -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R-bathDaCa.xml ss_bath/ 
#java -jar -Dneurord.writers=h5 -Dneurord.trials=3 -Dneurord.threads=1 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R-blockCyA.xml ss_bath/ &
#java -jar -Dneurord.writers=h5 -Dneurord.trials=3 -Dneurord.threads=1 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R-blockOA.xml ss_bath/ &

#java -jar -Dneurord.writers=h5 -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R-bathDendDa.xml ss_bath/ & 
#java -jar -Dneurord.writers=h5 -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R-bathDendCa.xml ss_bath/ &
#java -jar -Dneurord.writers=h5 -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R-bathDendDaCa.xml ss_bath/ 
#java -jar -Dneurord.writers=h5 -Dneurord.trials=3 -Dneurord.threads=1 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R-blockCyADendACh.xml ss_bath/ &
#java -jar -Dneurord.writers=h5 -Dneurord.trials=3 -Dneurord.threads=1 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R-blockOADendACh.xml ss_bath/ &

#java -jar -Dneurord.writers=h5 -Dneurord.trials=3 -Dneurord.threads=1 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R-blockCyA-bathDa.xml ss_bath/ &
#java -jar -Dneurord.writers=h5 -Dneurord.trials=3 -Dneurord.threads=1 /home/neuroware/stochdif/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R-blockCyA-bathCa.xml ss_bath/ 
#Test the restart = end of prior sim

####Using the release version of Neurord-3.1.2 (June 15, 2016)
#java -jar /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar -Dneurord.SDRun.runtime=10000 -v Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-noACh.xml ss_bath/Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1_noACh_10s-rbat
#java -jar /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar -v Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-noACh.xml ss_bath/Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1_noACh_250s-rbat
#java -jar /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar -Dneurord.trials=3 -v Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-noACh.xml ss_bath/Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1_noACh_250s_trials3-rbat
#java -jar ~zbyszek/neurord-3.1.2.jar Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-noACh.xml -Dneurord.trials=3 /var/tmp/Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1_noACh_nebish-rbat -v

java -jar /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar -v Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-nostim.xml ss_bath/Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-t1-nostim &
java -jar /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar -v Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-nostim.xml -Dneurord.trials=3 ss_bath/Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-t3-nostim &
java -jar ~zbyszek/neurord-3.1.2.jar -v Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-nostim.xml -Dneurord.trials=3 ss_bath/Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-t3z-nostim 
#java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar -v -s injections Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-noACh.xml ss_bath/ &
java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar -v -s injections Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-Da0.1.xml ss_bath/Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1_t1-Da0.1 &
java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar -v -s injections Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-Da0.3.xml ss_bath/Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1_t1-Da0.3 &
java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar -v -s injections Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-Da1.xml ss_bath/Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1_t1-Da1 &
java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar -v -s injections Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-Da10.xml ss_bath/Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1_t1-Da10 &
#alternative:
#To run things in parallel (instead of batch file):
#parallel --gnu java -Dstochdiff.writers=text -Dstochdiff.log=false -jar /home/neuroware/stochdif/stochdiff-3.0.0-9.jar ::: Model*.xml

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
