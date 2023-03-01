#!/bin/bash
set -Eeuo pipefail
cd "$(dirname "$0")"

cd ..

FOLDERS="download logs staging .ccache"
mkdir -p $FOLDERS

chmod 2770 $FOLDERS
chown 0:1000 $FOLDERS

for f in $FOLDERS ; do rm $f/* -rf ; done

umask 0007

./unofficial-builds/bin/build.sh v18.14.2
