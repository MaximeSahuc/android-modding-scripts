#/bin/bash

KEYSTORE_PATH='~/Documents/Android_Modding/Ressources/key.keystore'
KEYSTORE_PASSWORD=''

PACKAGE=$(basename $(ls *.apk) .apk)

# clean
echo "Cleanning dist folder"
rm ./$PACKAGE/dist/* 2>/dev/null

# build
echo
echo "Building apk"
apktool b "./${PACKAGE}" && echo "OK"

# align
echo
echo "Aligning apk"
zipalign 4 "./${PACKAGE}/dist/${PACKAGE}.apk" "./${PACKAGE}/dist/${PACKAGE}_alligned.apk" && echo "OK"

# sign
echo
echo "Signing apk"
apksigner sign --ks-key-alias key --ks $KEYSTORE_PATH --ks-pass "pass:${KEYSTORE_PASSWORD}" --out "./${PACKAGE}/dist/${PACKAGE}_signed.apk" "./${PACKAGE}/dist/${PACKAGE}_alligned.apk" && echo "OK"; echo ""; echo "Done"
