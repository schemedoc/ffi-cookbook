#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
rm -f s64vector-gambit.o1
gsc s64vector-gambit.scm
gsi s64vector-gambit.o1
