#Always run NeuroRD with the following command line, to direct output into the output directory.
#To start multiple NeuroRD simulations at once, add & at end of each line.
#run the batch file using: at -f NeuroRD.bat NOW (or you can specify a different time)
set -ex
java -jar /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar Model_CamKIInew-Cahz1.xml > /dev/null &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar Model_CamKIInew-Cahz2.5.xml > /dev/null&
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar Model_CamKIInew-Cahz4.xml > /dev/null &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar Model_CamKIIold-Cahz1.xml > /dev/null&
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar Model_CamKIIold-Cahz2.5.xml > /dev/null &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar Model_CamKIIold-Cahz4.xml > /dev/null 
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar Model_CamKIInew-Ca6-Cam100.xml > /dev/null &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar Model_CamKIInew-Ca6-Cam1000.xml > /dev/null &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar Model_CamKIInew-Ca6-Cam300.xml > /dev/null &
java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar Model_CamKIInew-Ca6-Cam5000.xml > /dev/null &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar Model_CamKIIold-Ca6-Cam100.xml > /dev/null &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar Model_CamKIIold-Ca6-Cam1000.xml > /dev/null &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar Model_CamKIIold-Ca6-Cam300.xml > /dev/null &
#java -jar  /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar Model_CamKIIold-Ca6-Cam5000.xml > /dev/null &

#alternative:
#To run things in parallel (instead of batch file):
#parallel --gnu java -Dstochdiff.writers=text  -jar /home/neuroware/stochdif/neurord-3.2.2-all-deps.jar ::: Model*.xml

