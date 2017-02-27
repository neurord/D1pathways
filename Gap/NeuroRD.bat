#To start multiple NeuroRD simulations at once, add & at end of each line.
#run the batch file using: at -f NeuroRD.bat NOW (or you can specify a different time)
#all of these sims together takes about 3 days
set -ex

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapA-Da0.1.xml  &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapA-Da0.3.xml  &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapA-Da1.xml  &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapA-Da10.xml  &

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapB-Da0.1.xml  &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapB-Da0.3.xml  &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapB-Da1.xml  &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapB-Da10.xml & 

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapC-Da0.1.xml  &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapC-Da0.3.xml  &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapC-Da1.xml  &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapC-Da10.xml  &

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapD-Da0.1.xml  &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapD-Da0.3.xml & 
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapD-Da1.xml  
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapD-Da10.xml & 

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapE-Da0.1.xml  &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapE-Da0.3.xml  &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapE-Da1.xml  &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapE-Da10.xml  &

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapA-bathDa.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapA-bathDaCa.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapB-bathDa.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapB-bathDaCa.xml &

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapC-bathDa.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapC-bathDaCa.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapD-bathDa.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapD-bathDaCa.xml &

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapE-bathDa.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapE-bathDaCa.xml

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapA-stimtheta-noReb.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapA-stim20hz-noReb.xml &

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapB-stimtheta-noReb.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapB-stim20hz-noReb.xml &

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapC-stimtheta-noReb.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapC-stim20hz-noReb.xml &

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-noReb.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-noReb.xml &

java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapE-stimtheta-noReb.xml &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar --ic-time -1 --ic ../Model_SPNspineAChm4R_Gshydr5_AC1_GiGsfast-nostim.h5 -v -s injections  Model_SPNspineAChm4R_Gshydr5_GapE-stim20hz-noReb.xml &

