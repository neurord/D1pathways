#To start multiple NeuroRD simulations at once, add & at end of each line.
#run the batch file using: at -f NeuroRD.bat NOW (or you can specify a different time)
set -ex

#java -ea -jar  /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_20um-sp1-stim20hz.xml &
#java -ea -jar  /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_20um-sp1-stimtheta.xml &

#java -jar  /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_20um-sp2adj-stim20hz.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_20um-sp2sep-stim20hz.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_20um-sp2adj-stimtheta.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_20um-sp2sep-stimtheta.xml &

#java -ea -jar  /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R-stim20hz.xml &
#java -ea -jar  /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R-stimtheta.xml &

#java -jar -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar -v -s injections Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-Da0.1.xml ss_bath/  &
#java -jar -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar -v -s injections Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-Da0.3.xml ss_bath/ &  
#java -jar -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar -v -s injections Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-Da1.xml ss_bath/ 
#java -jar -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar -v -s injections Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-Da10.xml ss_bath/ &

#java -jar  -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar -v -s injections Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-noACh.xml ss_bath/ &
#java -jar  -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar -v -s injections Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-nostim.xml ss_bath/ 

#java -jar /home/neuroware/stochdif/neurord-3.1.1.jar  --ic-time -1 --ic ss_bath/Model_SPNspineCaMKII_DagL_AChm4R-nostim.h5 Model_SPNspineCaMKII_DagL_AChm4R-nostim.xml ss_bath/Model_SPNspineCaMKII_DagL_AChm4R-nostimrestart
#NOTE, restart uses the low frequeny output in __main__

java -jar  -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-bathDa.xml ss_bath/ &
java -jar  -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-bathCa.xml ss_bath/ &
java -jar  -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-bathDaCa.xml ss_bath/ 
#Create IC files for CyA and OA, then create next 4 Model files
#java -jar  -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-blockOA.xml ss_bath/ &
#java -jar  -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-blockCyA.xml ss_bath/ &
#java -jar  -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-BlockCyA-bathDa.xml ss_bath/ &
#java -jar  -Dneurord.trials=3 /home/neuroware/stochdif/neurord-3.1.2-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R_Gshydr5_AC1-BlockCyA-bathCa.xml ss_bath/ 

#Test the restart = end of prior sim

