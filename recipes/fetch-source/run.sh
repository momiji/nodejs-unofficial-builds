#!/usr/bin/env bash

set -x
set -e

release_urlbase="$1"
disttype="$2"
customtag="$3"
datestring="$4"
commit="$5"
fullversion="$6"
source_url="$7"
config_flags=

cd /home/node

gpg_keys=$(curl -sL https://raw.githubusercontent.com/nodejs/docker-node/HEAD/keys/node.keys)

for key in ${gpg_keys}; do
  gpg --list-keys "$key" ||
      curl -fs "https://keys.openpgp.org/vks/v1/by-fingerprint/$key" -o "node-$key.asc" || \
      curl -fs "http://keyserver.ubuntu.com/pks/lookup?op=get&search=$key" -o "node-$key.asc" ; \
      gpg --batch --import "node-$key.asc" ; \
done

curl -fsSLO --compressed "$source_url"

if [[ "$disttype" = "release" ]]; then
  curl -fsSLO --compressed "${source_url}/../SHASUMS256.txt.asc"
  gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc
  grep " node-${fullversion}.tar.xz\$" SHASUMS256.txt | sha256sum -c -
fi

mv -f node-${fullversion}.tar.xz /out/
