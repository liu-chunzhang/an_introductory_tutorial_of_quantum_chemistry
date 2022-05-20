#!/bin/bash
#BSUB -J intel
#BSUB -o 3,8-dicl-dibenzene-ccpvtz.out
#BSUB -n 2
#BSUB -q cqueue
#BSUB -R "span[hosts=1]"

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

/apps/software/orca_5_0_0/orca 3,8-dicl-dibenzene-ccpvtz.inp >& 3,8-dicl-dibenzene-ccpvtz.out
