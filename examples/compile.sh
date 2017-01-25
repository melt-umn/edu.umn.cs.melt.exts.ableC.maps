#!/bin/bash

# This script shows the steps in compiling an extended C program (.xc)
# down to C via an extended instance of ableC and then using GCC to
# compile the generated C code to an executable.
# Of course, if the use of 'cut' below fails for you, then just run
# the commands individually by hand.

# Erm, yeah, let's add this...
set -e

java -jar ../artifact/ableC.jar $1 ${CFLAGS}

# extract the base filename, everything before the dot (.)

filename=$1
extension="${filename##*.}"
filename_withoutpath=$(basename $filename)
basefilename="${filename_withoutpath%.*}"

cfile="${basefilename}.c"

gcc ${CFLAGS} -lgc ${cfile}
