#!/bin/bash
set -Eeuo pipefail
cd "$(dirname "$0")"

mkdir -p recipes/.old

# hide all recipes, except fetch
for recipe in $(ls recipes | grep -v fetch) ; do
    mv recipes/$recipe recipes/.old/
done

# unhide chosen one
while [ -n "${1-}" ]; do
    recipe=$1
    [ -d recipes/.old/$recipe ] && mv recipes/.old/$recipe recipes/
done
