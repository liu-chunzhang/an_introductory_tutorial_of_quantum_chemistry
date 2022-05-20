#!/bin/bash
#BSUB -J intel
#BSUB -o cytosine-CASSCF-10-8.out
#BSUB -n 16
#BSUB -q cqueue
#BSUB -R "span[hosts=1]"

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

/apps/software/orca_5_0_0/orca cytosine-CASSCF-10-8.inp >& cytosine-CASSCF-10-8.out
