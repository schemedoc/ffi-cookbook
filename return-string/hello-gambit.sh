#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
rm -f hello-gambit.o1
gsc hello-gambit.scm
gsi hello-gambit.o1
