#!/bin/sh

set -e -u -x

cd "$(dirname ${0})"
echo "Entering directory '${PWD}'"

csc hello-chicken.scm
./hello-chicken
