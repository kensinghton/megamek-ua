#!/bin/bash
sCurrentPath=$(pwd)
sProgram=lab
case ${sProgram} in
  mm-startup) sProgramFull=megamek;;
  lab) sProgramFull=megameklab;;
  hq) sProgramFull=mekhq;;
  *) echo "sProgram is not set" && exit 1;;
esac
sMegaMekPath="/home/axeller/games/mekhq-0.47.2"
#mkdir ${sMegaMekPath}/
cp -r megameklab/* ${sMegaMekPath}/
#mkdir ${sMegaMekPath}/${sProgramFull}/
mv ${sMegaMekPath}/resources/${sProgramFull} ${sMegaMekPath}/
cd ${sMegaMekPath}/${sProgramFull}/resources
for sFile in *.properties; do
  echo $sFile
  mv --  "${sFile}" "${sFile/_ua/_en}"
  #rename 's/_ua/_en/g' *
  echo $sFile
done
cd ${sMegaMekPath}
#cp -uf ${sMegaMekPath}/MegaMekLab.jar ${sMegaMekPath}/resources/${sProgramFull}/resources/
bash ${sMegaMekPath}/${sProgram}
cd $sCurrentPath
#rm -rf ${sMegaMekPath}/resources
