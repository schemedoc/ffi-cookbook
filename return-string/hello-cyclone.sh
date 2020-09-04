#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
cyclone hello-cyclone.scm
./hello-cyclone
