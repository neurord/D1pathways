#To start multiple NeuroRD simulations at once, add & at end of each line.
#run the batch file using: at -f NeuroRD.bat NOW (or you can specify a different time)
set -ex
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.xml 

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-bathCa.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-bathDa.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-bathDaCa.xml ss_bath/ 

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca100m-dhpg25.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca100m-dhpg0.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca100m-dhpg1.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca100m-dhpg5.xml UchiNew/ 

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca1s-dhpg25.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca1s-dhpg5.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca1s-dhpg0.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca1s-dhpg1.xml UchiNew/ 

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca5s-dhpg0.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca5s-dhpg1.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca5s-dhpg25.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca5s-dhpg5.xml UchiNew/  

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-noACh.xml ss_bath/ &

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-blockCyA.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-blockOA.xml ss_bath/ 

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-Da0.1.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-Da0.3.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-Da1.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-Da10.xml ss_bath/ 

#THETA/20Hz (GiFast) 
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-stimtheta-noReb.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-stim20hz-noReb.xml  &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-stim20hz-noACh.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-stimtheta-noACh.xml 

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-stimtheta-noCKp.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-stim20hz-noCKp.xml &

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-stimtheta-blockMGlu.xml  &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-stim20hz-blockMGlu.xml  

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-DaDelay-stim20hz.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-DaDelay-stimtheta.xml &

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-stimtheta-blockM1.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-stim20hz-blockM1.xml 

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-stimtheta-blockM4.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-stim20hz-blockM4.xml 

#These have been updated and are ready to go
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar -v -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-sp1-stimtheta.xml&
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar -v -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-sp1-stim20hz.xml&
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar -v -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-sp2sep-stimtheta.xml&
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar -v -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-sp2adj-stimtheta.xml&
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar -v -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-sp2adj-stim20hz.xml&
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar -v -s injections Model_SPNspineAChm4R_Gshydr5_AC1_couple-sp2sep-stim20hz.xml&
