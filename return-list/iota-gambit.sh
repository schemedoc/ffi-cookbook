#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
rm -f iota-gambit.o1
gsc iota-gambit.scm
gsi iota-gambit.o1
