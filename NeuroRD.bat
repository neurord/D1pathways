#Always run NeuroRD with the following command line, to direct output into the output directory.
#To start multiple NeuroRD simulations at once, add & at end of each line.
#run the batch file using: at -f NeuroRD.bat NOW (or you can specify a different time)
set -ex
java -jar /home/neuroware/stochdif/v2.1.9/stochdiff2.1.9.jar Model_MSPNmerge.xml output/Model_MSPNmerge.out > output/MSPNmerge.log
