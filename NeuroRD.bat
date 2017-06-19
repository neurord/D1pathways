#To start multiple NeuroRD simulations at once, add & at end of each line.
#run the batch file using: at -f NeuroRD.bat NOW (or you can specify a different time)
#set -ex
#no stim: 
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar Model_SPNspineAChm4R_Gshydr5_GapD-nostim.xml 

#THETA/20Hz: 16-19 hours each (mean 18/0.75 days).  Set1
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-noReb_DaDec1.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-noReb_lowDaDec2.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-noReb_lowDaDec3.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-bathDa.xml ss_bath/ 

# Set2
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-blockMGlu.xml  &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-blockMGlu.xml  &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-blockM1.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-blockM1.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-bathCa.xml ss_bath/ 

#Set3
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-blockM4.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-blockM4.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-noCKp.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-noCKp.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-bathDaCa.xml ss_bath/ 

#Set4
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-AChnoB.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-AChnoB.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-AChnoDip.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-AChnoDip.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stim20hz-alcCtrl.xml 
#finished to here by Tues morn

#Set5
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-AChflat.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-AChflat.xml &

java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-noReb_DaDelay.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-noReb_DaDelay.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stimtheta-alcCtrl.xml 

#set6
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stim20hz-alcIC.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stim20hz-alcNMDA_IC.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stimtheta-alcNMDA_IC.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stimtheta-alcIC.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stim20hz-alcNMDA_Da_IC.xml

#set7
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stimtheta-alcNMDA_Da_IC.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stim20hz-alcNMDA.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stimtheta-alcNMDA.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stim20hz-alcNMDA_Da.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspine_GapD_alcohol-stimtheta-alcNMDA_Da.xml 

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

Finish to here by Fri eve

#set8&9 - long sims 9 days each?
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-blockCyA.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-sp1-stimtheta.xml&
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-sp1-stim20hz.xml&
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-sp2sep-stimtheta.xml&
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-sp2sep-stim20hz.xml&

java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-blockOA.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-sp2adj-stimtheta.xml 
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-sp2adj-stim20hz.xml&
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-sp2other-stimtheta.xml&
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-sp2other-stim20hz.xml

