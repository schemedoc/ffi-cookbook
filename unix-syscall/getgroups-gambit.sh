#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
rm -f getgroups-gambit.o1
gsc getgroups-gambit.scm
gsi getgroups-gambit.o1
