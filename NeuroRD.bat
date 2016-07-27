#To start multiple NeuroRD simulations at once, add & at end of each line.
#run the batch file using: at -f NeuroRD.bat NOW (or you can specify a different time)
set -ex

#java -ea -jar  /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_20um-sp1-stim20hz.xml &
#java -ea -jar  /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_20um-sp1-stimtheta.xml &

#java -jar  /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_20um-sp2adj-stim20hz.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_20um-sp2sep-stim20hz.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_20um-sp2adj-stimtheta.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_20um-sp2sep-stimtheta.xml &

#trials=3 gave strange results for Da1 (cAMP drops to zero) and Da0.1 (Leak=0 so calcium drops to 0) and DaCa (DaOut=0)
java -jar /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar -v -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-noACh.xml ss_bath/ &
java -jar /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar --ic-time -1 --ic ss_bath/Model_SPNspineAChm4R_Gshydr5_AC1_couple-nostim.h5 Model_SPNspineAChm4R_Gshydr5_AC1_couple-nostim.xml ss_bath/Model_SPNspineAChm4R_Gshydr5_AC1_couple-nostimrestart &
#Test restart  capability. NOTE, restart uses the low frequeny output in __main__
#java -jar /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar -v -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-nostim.xml ss_bath/ &
java -jar /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar -v -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-Da0.1.xml ss_bath/  &
java -jar /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar -v -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-Da0.3.xml ss_bath/ &  
java -jar /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar -v -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-Da1.xml ss_bath/ &
java -jar /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar -v -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-Da10.xml ss_bath/ 

java -ea -jar  /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar -v -s injections Model_SPNspineCaMKII_DagL_AChm4R-stim20hz.xml &
java -ea -jar  /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar -v -s injections Model_SPNspineCaMKII_DagL_AChm4R-stimtheta.xml &

#compare above with ss_bath/Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1_noACh_250s_trials3-r*.h5
#java -jar /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar Model_SPNspineAChm4R_Gshydr5_AC1_couple-bathDa.xml ss_bath/ &
#java -jar /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar Model_SPNspineAChm4R_Gshydr5_AC1_couple-bathCa.xml ss_bath/ &
#java -jar /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar Model_SPNspineAChm4R_Gshydr5_AC1_couple-bathDaCa.xml ss_bath/  
#java -jar /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-BlockCyA-bathDa.xml ss_bath/ &
#java -jar /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-BlockCyA-bathCa.xml ss_bath/ &
#java -jar /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-blockOA.xml ss_bath/ & 
#java -jar /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-blockCyA.xml ss_bath/ 

#java -jar /home/neuroware/stochdif/neurord-3.1.1.jar  --ic-time -1 --ic ss_bath/Model_SPNspineAChm4R_Gshydr5_AC1_couple-nostim.h5 Model_SPNspineAChm4R_Gshydr5_AC1_couple-nostim.xml ss_bath/Model_SPNspineAChm4R_Gshydr5_AC1_couple-


#Create IC files for CyA and OA, then create next 4 Model files
#java -jar  -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-blockOA.xml ss_bath/ &
#java -jar  -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-blockCyA.xml ss_bath/ &
#java -jar  -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-BlockCyA-bathDa.xml ss_bath/ &
#java -jar  -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-BlockCyA-bathCa.xml ss_bath/ 

#Test the restart = end of prior sim

