#To start multiple NeuroRD simulations at once, add & at end of each line.
#run the batch file using: at -f NeuroRD.bat NOW (or you can specify a different time)
set -ex
java -jar  /home/neuroware/stochdif/neurord-3.1.4-all-deps.jar Model_SPNspineAChm4R_Gshydr5_AC1_Gifast-nostim.xml 

#THETA/20Hz (1st time with new params and coupled stim) 
java -jar  /home/neuroware/stochdif/neurord-3.1.4-all-deps.jar --ic-time -1 --ic ss_bath/Model_SPNspineAChm4R_Gshydr5_AC1_couple-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_couple-stimthetaNoReb.xml &
java -jar  /home/neuroware/stochdif/neurord-3.1.4-all-deps.jar --ic-time -1 --ic ss_bath/Model_SPNspineAChm4R_Gshydr5_AC1_couple-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_couple-stim20hzNoReb.xml &

java -jar  /home/neuroware/stochdif/neurord-3.1.4-all-deps.jar --ic-time -1 --ic ss_bath/Model_SPNspineAChm4R_Gshydr5_AC1_Gifast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_Gifast-stimthetaNoReb.xml &
java -jar  /home/neuroware/stochdif/neurord-3.1.4-all-deps.jar --ic-time -1 --ic ss_bath/Model_SPNspineAChm4R_Gshydr5_AC1_Gifast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_Gifast-stim20hzNoReb.xml &

#java -jar  /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar --ic-time -1 --ic ss_bath/Model_SPNspineAChm4R_Gshydr5_AC1_couple-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_couple-stimtheta.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar --ic-time -1 --ic ss_bath/Model_SPNspineAChm4R_Gshydr5_AC1_couple-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_couple-stim20hz.xml &

#java -jar  /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar --ic-time -1 --ic ss_bath/Model_SPNspineAChm4R_Gshydr5_AC1_couple-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_couple-stimtheta8s.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar --ic-time -1 --ic ss_bath/Model_SPNspineAChm4R_Gshydr5_AC1_couple-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_couple-stim20hz8s.xml 

#java -jar  /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar -v -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-sp2sep-stimtheta.xml&
#java -jar  /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar -v -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-sp2adj-stimtheta.xml&
#java -jar  /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar -v -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-sp1-stimtheta.xml&
#java -jar  /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar -v -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-sp1-stim20hz.xml&
#java -jar  /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar -v -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-sp2adj-stim20hz.xml&
#java -jar  /home/neuroware/stochdif/neurord-3.1.3-all-deps.jar -v -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-sp2sep-stim20hz.xml&
