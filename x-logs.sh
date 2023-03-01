#!/bin/bash
set -Eeuo pipefail
cd "$(dirname "$0")"

cd ..

tail -f logs/$(ls logs/ | tail -1)/*
