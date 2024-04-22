#/bin/bash

PACKAGE=$(basename $(ls *.apk) .apk)

# adb uninstall $PACKAGE 2> /dev/null
adb install "./${PACKAGE}/dist/${PACKAGE}_signed.apk"
