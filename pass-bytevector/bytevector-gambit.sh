#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
rm -f bytevector-gambit.o1
gsc bytevector-gambit.scm
gsi bytevector-gambit.o1
