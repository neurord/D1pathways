#Always run NeuroRD with the following command line, to direct output into the output directory.
#To start multiple NeuroRD simulations at once, add & at end of each line.
#run the batch file using: at -f NeuroRD.bat NOW (or you can specify a different time)
set -ex
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9um-Block1.xml output/Model_MSPNmerge0.9um-Block1 &
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9um-Block2.xml output/Model_MSPNmerge0.9um-Block2 &
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9umPKAcD1R_CaB.xml output/Model_MSPNmerge0.9umPKAcD1R_CaB &
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9umPKAcD1R_DaB.xml output/Model_MSPNmerge0.9umPKAcD1R_DaB &
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmergeSpine.xml output/Model_MSPNmergeSpine &

#alternative:
#To run things in parallel (instead of batch file):
#parallel --gnu java -Dstochdiff.writers=text -jar /home/neuroware/stochdif/stochdiff-3.0.0-8.jar ::: Model_cAMPassaySoma*.xml

