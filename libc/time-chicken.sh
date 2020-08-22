#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
csc libc-time-chicken.scm
./libc-time-chicken
