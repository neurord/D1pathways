#Always run NeuroRD with the following command line, to direct output into the output directory.
#To start multiple NeuroRD simulations at once, add & at end of each line.
#run the batch file using: at -f NeuroRD.bat NOW (or you can specify a different time)
set -ex
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9um-PDEhigh-BlockOA.xml output/Model_MSPNmerge0.9um-PDEhigh-BlockOA > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9um-PDEhigh-BlockCyA.xml output/Model_MSPNmerge0.9um-PDEhigh-BlockCyA > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9umPKAcD1R-PDEhigh-BathCa.xml output/Model_MSPNmerge0.9umPKAcD1R-PDEhigh-BathCa > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9umPKAcD1R-PDEhigh-BathDa.xml output/Model_MSPNmerge0.9umPKAcD1-PDEhigh-BathDa > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9umPKAcD1R-PDEhigh-BathDaCa.xml output/Model_MSPNmerge0.9umPKAcD1R-PDEhigh-BathDaCa > /dev/null&
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmergeSpine-PDEhigh.xml output/Model_MSPNmergeSpine-PDEhigh > /dev/null&
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9um-PDEhigh-BlockCyA-BathDa.xml output/Model_MSPNmerge0.9um-PDEhigh-BlockCyA-BathDa > /dev/null&  
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9um-PDEhigh-BlockCyA-BathDaCa.xml output/Model_MSPNmerge0.9um-PDEhigh-BlockCyA-BathDaCa > /dev/null&

#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9um-PDElow-BlockOA.xml output/Model_MSPNmerge0.9um-PDElow-BlockOA > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9um-PDElow-BlockCyA.xml output/Model_MSPNmerge0.9um-PDElow-BlockCyA > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9umPKAcD1R-PDElow-BathCa.xml output/Model_MSPNmerge0.9umPKAcD1R-PDElow-BathCa > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9umPKAcD1R-PDElow-BathDa.xml output/Model_MSPNmerge0.9umPKAcD1-PDElow-BathDa > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9umPKAcD1R-PDElow-BathDaCa.xml output/Model_MSPNmerge0.9umPKAcD1R-PDElow-BathDaCa > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmergeSpine-PDElow.xml output/Model_MSPNmergeSpine-PDElow > /dev/null&
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9um-PDElow-BlockCyA-BathDa.xml output/Model_MSPNmerge0.9um-PDElow-BlockCyA-BathDa > /dev/null&
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9um-PDElow-BlockCyA-BathDaCa.xml output/Model_MSPNmerge0.9um-PDElow-BlockCyA-BathDaCa > /dev/null&

#alternative:
#To run things in parallel (instead of batch file):
#parallel --gnu java -Dstochdiff.writers=text -jar /home/neuroware/stochdif/stochdiff-3.0.0-8.jar ::: Model_cAMPassaySoma*.xml

