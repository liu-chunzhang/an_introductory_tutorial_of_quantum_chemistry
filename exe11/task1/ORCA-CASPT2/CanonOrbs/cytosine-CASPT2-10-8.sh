#!/bin/bash
#BSUB -J intel
#BSUB -o cytosine-CASPT2-10-8.out
#BSUB -n 32
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/cytosine-CASPT2-10-8_924
scp $USER@mgt01:/apps/users/lcz/exe11/task1/ORCA/canonorbs/cytosine-CASPT2-10-8.inp /scratch/cytosine-CASPT2-10-8_924
scp $USER@mgt01:/apps/users/lcz/exe11/task1/ORCA/canonorbs/cytosine-RHF.gbw /scratch/cytosine-CASPT2-10-8_924
/apps/software/orca_5_0_0/orca /scratch/cytosine-CASPT2-10-8_924/cytosine-CASPT2-10-8.inp >& cytosine-CASPT2-10-8.out
scp /scratch/cytosine-CASPT2-10-8_924/*.gbw $USER@mgt01:/apps/users/lcz/exe11/task1/ORCA/canonorbs
scp /scratch/cytosine-CASPT2-10-8_924/*.xyz $USER@mgt01:/apps/users/lcz/exe11/task1/ORCA/canonorbs
scp /scratch/cytosine-CASPT2-10-8_924/*.trj $USER@mgt01:/apps/users/lcz/exe11/task1/ORCA/canonorbs
