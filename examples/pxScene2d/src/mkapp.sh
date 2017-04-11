#!/bin/bash

externalDir=../external
bundle=pxscene.app
bundleBin=$bundle/Contents/MacOS
bundleLib=$bundleBin/lib

rm -rf $bundle

[ -d $bundleLib ] || mkdir -p $bundleLib
cp $externalDir/png/.libs/libpng16.16.dylib $bundleLib
cp $externalDir/curl/lib/.libs/libcurl.4.dylib $bundleLib
#cp $externalDir/libnode/out/Release/libnode.dylib $bundleLib
cp $externalDir/libnode-v6.9.0/out/Release/libnode*.dylib $bundleLib
cp $externalDir/ft/objs/.libs/libfreetype.6.dylib $bundleLib
cp $externalDir/zlib/libz.a $bundleLib

cp macstuff/Info.plist $bundle/Contents
cp -a images $bundleBin/images
cp FreeSans.ttf $bundleBin
cp browser.js $bundleBin
cp testRunner_memcheck.js $bundleBin
cp init.js $bundleBin
cp shell.js $bundleBin
cp package.json $bundleBin
cp pxscene $bundleBin
cp macstuff/pxscene.sh $bundleBin
cp macstuff/EngineRunner $bundleBin
cp -a rcvrcore $bundleBin/rcvrcore
cp -a node_modules $bundleBin/node_modules
cp -a macstuff/Resources $bundle/Contents/Resources
