#!/bin/bash
#BSUB -J intel
#BSUB -o ben-cas66-ccpvtz.out
#BSUB -n 8
#BSUB -q cqueue
#BSUB -R "span[hosts=1]"

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

/apps/software/orca_5_0_0/orca ben-cas66-ccpvtz.inp >& ben-cas66-ccpvtz.out
