#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
rm -f cpuid-gambit.o1
gsc cpuid-gambit.scm
gsi cpuid-gambit.o1
