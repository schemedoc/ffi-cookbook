#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
csc hello-chicken.scm
./hello-chicken
