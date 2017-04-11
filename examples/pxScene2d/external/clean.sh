#!/bin/bash
set -e
# Any subsequent(*) commands which fail will cause the shell script to exit immediately

#--------- CURL 
cd curl
make clean -j3
cd ..

#--------- FT 
cd ft
./configure
make clean -j3
cd ..

#--------- JPG 
cd jpg
make clean -j3
cd ..

#--------- PNG 
cd png
make clean -j3
cd ..

#--------- ZLIB 
cd zlib
make clean -j3
cd ..

#--------- LIBNODE 
cd libnode-v6.9.0
make clean -j3
cd ..

