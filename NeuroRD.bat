#Always run NeuroRD with the following command line, to direct output into the output directory.
#To start multiple NeuroRD simulations at once, add & at end of each line.
#run the batch file using: at -f NeuroRD.bat NOW (or you can specify a different time)
set -ex
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9um-PDEhigh-BlockOA.xml output/Model_MSPNmerge0.9um-PDEhigh-BlockOA > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9um-PDEhigh-BlockCyA.xml output/Model_MSPNmerge0.9um-PDEhigh-BlockCyA > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9umPKAcD1R-PDEhigh-BathCa.xml output/Model_MSPNmerge0.9umPKAcD1R-PDEhigh-BathCa > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9umPKAcD1R-PDEhigh-BathDa.xml output/Model_MSPNmerge0.9umPKAcD1-PDEhigh-BathDa > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9umPKAcD1R-PDEhigh-BathDaCa.xml output/Model_MSPNmerge0.9umPKAcD1R-PDEhigh-BathDaCa > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmergeSpine-PDEhigh.xml output/Model_MSPNmergeSpine-PDEhigh > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9um-PDEhigh-BlockCyA-BathDa.xml output/Model_MSPNmerge0.9um-PDEhigh-BlockCyA-BathDa > /dev/null&  
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9um-PDEhigh-BlockCyA-BathDaCa.xml output/Model_MSPNmerge0.9um-PDEhigh-BlockCyA-BathDaCa > /dev/null&

#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9um-PDElow-BlockOA.xml output/Model_MSPNmerge0.9um-PDElow-BlockOA > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9um-PDElow-BlockCyA.xml output/Model_MSPNmerge0.9um-PDElow-BlockCyA > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9umPKAcD1R-PDElow-BathCa.xml output/Model_MSPNmerge0.9umPKAcD1R-PDElow-BathCa > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9umPKAcD1R-PDElow-BathDa.xml output/Model_MSPNmerge0.9umPKAcD1-PDElow-BathDa > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9umPKAcD1R-PDElow-BathDaCa.xml output/Model_MSPNmerge0.9umPKAcD1R-PDElow-BathDaCa > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmergeSpine-PDElow.xml output/Model_MSPNmergeSpine-PDElow > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9um-PDElow-BlockCyA-BathDa.xml output/Model_MSPNmerge0.9um-PDElow-BlockCyA-BathDa > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-9.jar Model_MSPNmerge0.9um-PDElow-BlockCyA-BathDaCa.xml output/Model_MSPNmerge0.9um-PDElow-BlockCyA-BathDaCa > /dev/null&

#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-11.jar Model_SPNspineCaMKII_DagL-stim20hz.xml > /dev/null&
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-11.jar Model_SPNspineCaMKII_DagL-stimtheta.xml > /dev/null&

#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-11.jar Model_Spine_AChtest-stim20hz.xml > /dev/null &
#java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-11.jar Model_Spine_AChtest-stimtheta.xml > /dev/null &

java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.0-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R-stim20hz.xml &
java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.0-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R-stimtheta.xml &

#java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.0.5.jar  Model_SPNspineCaMKII_DagL_AChm4R-Da0.1.xml ss_bath/Model_SPNspineCaMKII_DagL_AChm4R-Da0.1  &
#java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.0.5.jar  Model_SPNspineCaMKII_DagL_AChm4R-Da0.3.xml ss_bath/Model_SPNspineCaMKII_DagL_AChm4R-Da0.3  &
#java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.0.5.jar  Model_SPNspineCaMKII_DagL_AChm4R-Da1.xml ss_bath/Model_SPNspineCaMKII_DagL_AChm4R-Da1 &
#java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.0.5.jar  Model_SPNspineCaMKII_DagL_AChm4R-Da100.xml ss_bath/Model_SPNspineCaMKII_DagL_AChm4R-Da100 &

java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.0-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R-bathDa.xml ss_bath/ &
java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.0-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R-bathCa.xml ss_bath/ &
java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.0-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R-bathDaCa.xml ss_bath/ &

java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.0-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R-blockCyA-bathDa.xml ss_bath/ &
java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.0-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R-blockCyA-bathCa.xml ss_bath/ &
java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.0-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R-blockCyA.xml ss_bath/ &
java -jar -Dneurord.writers=h5 /home/neuroware/stochdif/neurord-3.1.0-all-deps.jar Model_SPNspineCaMKII_DagL_AChm4R-blockOA.xml ss_bath/ &

#alternative:
#To run things in parallel (instead of batch file):
#parallel --gnu java -Dstochdiff.writers=text -Dstochdiff.log=false -jar /home/neuroware/stochdif/stochdiff-3.0.0-9.jar ::: Model*.xml

#ptdump to look at h5 file.
