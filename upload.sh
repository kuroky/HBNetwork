#!/bin/bash

VersionString=`grep -E 's.version.*=' HBNetwork.podspec`
VersionNumber=`tr -cd 0-9 <<<"$VersionString"`
NewVersionNumber=$(($VersionNumber + 1))
LineNumber=`grep -nE 's.version.*=' HBNetwork.podspec | cut -d : -f1`

git add .
git commit -am modification
git pull origin master --tags

sed -i "" "${LineNumber}s/${VersionNumber}/${NewVersionNumber}/g" HBNetwork.podspec

echo "current version is ${VersionNumber}, new version is ${NewVersionNumber}"
say "current version is ${VersionNumber}, new version is ${NewVersionNumber}"

git commit -am ${NewVersionNumber}
git tag ${NewVersionNumber}
git push origin master --tags
cd ~/.cocoapods/repos/HB_iOS_Specs && git pull origin master && cd - && pod repo push HB_iOS_Specs HBNetwork.podspec --verbose --allow-warnings --use-libraries
