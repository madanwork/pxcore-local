#!/bin/bash

#Get absolute path to this script
THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$THIS_DIR"

export DYLD_LIBRARY_PATH=./lib/
export LD_LIBRARY_PATH=./lib/

#valgrind integration
#suppressions are enabled to ignore the errors not interested
if [ $ENABLE_VALGRIND -eq 1 ]
then
if [ -z $VALGRINDLOGS ]
then
VALGRINDLOGS=valgrind_logs
fi
echo "valgrind --tool=memcheck --log-file=$VALGRINDLOGS --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes ./pxscene $*"
if [ -z $SUPPRESSIONS ]
then
valgrind --tool=memcheck --log-file=$VALGRINDLOGS --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes ./pxscene $*
else
valgrind --tool=memcheck --suppressions=$SUPPRESSIONS  --log-file=$VALGRINDLOGS --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes ./pxscene $*
fi
else
./pxscene $* < /dev/zero >> /var/tmp/pxscene.log 2>&1 &
fi
# Software update below

# Get pid of last background process which should be pxscene
PXPID=$!

# This file is required by the .engine_install script
# so that it can wait for pxscene to shutdown prior to software update
echo $PXPID > ./lastpid

# Only try to update this bundle if a version has been included
# and if this directory is writeable (not a .dmg for example)
if [ -e ./version ] && [ -w . ]; then

echo "Info: Checking for Software Update"

VERSION=`cat ./version`
UPDATE_URL=http://www.pxscene.org/dist/osx/pxscene/software_update.plist

./EngineRunner run -productid org.pxscene.pxscene -version $VERSION -url ${UPDATE_URL} &

else
    echo "Info: No ./version file assuming dev build.  Skip software update"
fi



