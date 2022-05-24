#!/bin/bash
#BSUB -J intel
#BSUB -o CH2-CAS22.out
#BSUB -n 4
#BSUB -q cqueue
#BSUB -R "span[hosts=1]"

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

/apps/software/orca_5_0_0/orca CH2-CAS22.inp >& CH2-CAS22.out
