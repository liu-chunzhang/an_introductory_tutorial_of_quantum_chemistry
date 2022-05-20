#!/bin/bash
#BSUB -J intel
#BSUB -o cytosine-CASPT2-14-10.out
#BSUB -n 32
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/cytosine-CASPT2-14-10_823
scp $USER@mgt01:/apps/users/lcz/exe11/task1/ORCA/cytosine-CASPT2-14-10.inp /scratch/cytosine-CASPT2-14-10_823
scp $USER@mgt01:/apps/users/lcz/exe11/task1/ORCA/cytosine-RHF.gbw /scratch/cytosine-CASPT2-14-10_823
/apps/software/orca_5_0_0/orca /scratch/cytosine-CASPT2-14-10_823/cytosine-CASPT2-14-10.inp >& cytosine-CASPT2-14-10.out
scp /scratch/cytosine-CASPT2-14-10_823/*.gbw $USER@mgt01:/apps/users/lcz/exe11/task1/ORCA
scp /scratch/cytosine-CASPT2-14-10_823/*.xyz $USER@mgt01:/apps/users/lcz/exe11/task1/ORCA
scp /scratch/cytosine-CASPT2-14-10_823/*.trj $USER@mgt01:/apps/users/lcz/exe11/task1/ORCA
