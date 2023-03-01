#!/bin/bash
set -Eeuo pipefail
cd "$(dirname "$0")"

# hack docker to use podman and inject certificates for alpine and centos
docker() {
    action=$1
    [ "$action" = "system" ] && return 0
    shift
    podman $action --network host \
        -v /etc/pki/tls/cert.pem:/etc/ssl/cert.pem:ro \
        -v /etc/pki/tls/cert.pem:/etc/pki/tls/cert.pem \
        "$@"
}
export -f docker

# call script
./bin/prepare-images.sh
