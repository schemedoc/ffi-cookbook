#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
rm -f uname-gambit.o1
gsc uname-gambit.scm
gsi uname-gambit.o1
