#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
rm -f vector-gambit.o1
gsc vector-gambit.scm
gsi vector-gambit.o1
