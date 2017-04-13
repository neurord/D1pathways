#To start multiple NeuroRD simulations at once, add & at end of each line.
#run the batch file using: at -f NeuroRD.bat NOW (or you can specify a different time)
#all of these sims together takes about 4 days (excluding long dendrite sims)
#set -ex
#no stim: 9 hours
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar Model_SPNspineAChm4R_Gshydr5_GapD-nostim.xml 

#42 hours noACh 5 hours, block: 6 hours Thurs even: obtain summary Dp34 and Dp75 values from middle of simulations to  create graphs for presentation
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-bathDa.xml ss_bath/ &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-noACh.xml ss_bath/ &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-blockCyA.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-blockOA.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar  -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-blockPap.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar  -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-blockRoli.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-noReb_DaDec1.xml 

#bath: 10 (Da) -15 hours (Ca)
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-bathCa.xml ss_bath/ &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-bathDaCa.xml ss_bath/ &

#block-bath: 13 hours
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-BlockOA-bathCa.xml ss_bath/ &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-BlockCyA-bathCa.xml ss_bath/

#THETA/20Hz 9.5 hours each, 4 sets = 1.6 days; 3.2 days if running 2 at a time (6 processors)
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-noReb_lowDaDec1.xml

#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-noReb_lowDaDec2.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-noReb_lowDaDec3.xml

#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-blockMGlu.xml  &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-blockMGlu.xml  

#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-blockM1.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-blockM1.xml 
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-blockM4.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-blockM4.xml 

#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-AChnoDip.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-AChnoDip.xml 
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-AChnoB.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-AChnoB.xml 

#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-noCKp.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-noCKp.xml 
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-AChflat.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-AChflat.xml 

#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-noReb_DaDelay.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-noReb_DaDelay.xml


#2 spine sims.  Each takes ~5 days - do all at once (sat morn-thur morn)
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar -v -s injections -Dneurord.trials=2 Model_SPNspineAChm4R_Gshydr5_GapD-sp1-stimtheta.xml&
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar -v -s injections -Dneurord.trials=2 Model_SPNspineAChm4R_Gshydr5_GapD-sp1-stim20hz.xml&
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar -v -s injections -Dneurord.trials=2 Model_SPNspineAChm4R_Gshydr5_GapD-sp2sep-stimtheta.xml &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar -v -s injections -Dneurord.trials=2 Model_SPNspineAChm4R_Gshydr5_GapD-sp2adj-stimtheta.xml&
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar -v -s injections -Dneurord.trials=2 Model_SPNspineAChm4R_Gshydr5_GapD-sp2adj-stim20hz.xml&
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar -v -s injections -Dneurord.trials=2 Model_SPNspineAChm4R_Gshydr5_GapD-sp2sep-stim20hz.xml&

#30 hours to here
#Uchi: 5 hours
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca100m-dhpg25.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca100m-dhpg0.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca100m-dhpg1.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca100m-dhpg5.xml UchiNew/ 

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca1s-dhpg25.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca1s-dhpg5.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca1s-dhpg0.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca1s-dhpg1.xml UchiNew/ 

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca5s-dhpg0.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca5s-dhpg1.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca5s-dhpg25.xml UchiNew/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 UchiNew/Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast_Uchi-Ca5s-dhpg5.xml UchiNew/  

#Da dur: 7 hours
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-Da0.1.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-Da0.3.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-Da1.xml ss_bath/ &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic Model_SPNspineAChm4R_Gshydr5_GapD-nostim.h5 -v -s injections -Dneurord.trials=3 Model_SPNspineAChm4R_Gshydr5_GapD-Da10.xml ss_bath/ 

