#/bin/bash

PACKAGE=$(basename $(ls *.apk) .apk)

# decompile
apktool d -f -r "${PACKAGE}.apk"

# patch XML
# decode : java -jar xml2axml d [AndroidManifest-bin-in.xml] [AndroidManifest-readable-out.xml]
# patch  : android:extractNativeLibs="false" -> android:extractNativeLibs="true"
# encode : java -jar xml2axml e [AndroidManifest-readable-in.xml] [AndroidManifest-bin-out.xml]
