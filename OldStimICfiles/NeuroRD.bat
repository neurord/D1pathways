#Always run NeuroRD with the following command line, to direct output into the output directory.
#To start multiple NeuroRD simulations at once, add & at end of each line.
#run the batch file using: at -f NeuroRD.bat NOW (or you can specify a different time)
set -ex
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-10.jar Model_CamKIInew_pDglUchi100ms-dhpg0.xml > /dev/null&
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-10.jar Model_CamKIInew_pDglUchi1s-dhpg0.xml > /dev/null
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-10.jar Model_CamKIInew_pDglUchi5s-dhpg0.xml > /dev/null&
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-10.jar Model_CamKIInew_pDglUchi100ms-dhpg1.xml > /dev/null
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-10.jar Model_CamKIInew_pDglUchi1s-dhpg1.xml > /dev/null&
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-10.jar Model_CamKIInew_pDglUchi5s-dhpg1.xml > /dev/null
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-10.jar Model_CamKIInew_pDglUchi100ms-dhpg25.xml > /dev/null&
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-10.jar Model_CamKIInew_pDglUchi1s-dhpg25.xml > /dev/null
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-10.jar Model_CamKIInew_pDglUchi5s-dhpg25.xml > /dev/null&
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-10.jar Model_CamKIInew_pDglUchi100ms-dhpg5.xml > /dev/null
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-10.jar Model_CamKIInew_pDglUchi1s-dhpg5.xml > /dev/null&
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-10.jar Model_CamKIInew_pDglUchi5s-dhpg5.xml > /dev/null
java -jar -Dstochdiff.log=false /home/neuroware/stochdif/stochdiff-3.0.0-10.jar Model_CamKIInew_pDglUchi5s-dhpg5.xml > /dev/null

#alternative:
#To run things in parallel (instead of batch file):
#parallel --gnu java -Dstochdiff.writers=text -Dstochdiff.log=false -jar /home/neuroware/stochdif/stochdiff-3.0.0-10.jar ::: Model*.xml

