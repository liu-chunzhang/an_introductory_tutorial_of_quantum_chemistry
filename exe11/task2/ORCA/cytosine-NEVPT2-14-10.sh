#!/bin/bash
#BSUB -J intel
#BSUB -o cytosine-NEVPT2-14-10.out
#BSUB -n 32
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/cytosine-NEVPT2-14-10_829
scp $USER@mgt01:/apps/users/lcz/exe11/task2/ORCA/cytosine-NEVPT2-14-10.inp /scratch/cytosine-NEVPT2-14-10_829
scp $USER@mgt01:/apps/users/lcz/exe11/task2/ORCA/cytosine-RHF.gbw /scratch/cytosine-NEVPT2-14-10_829
/apps/software/orca_5_0_0/orca /scratch/cytosine-NEVPT2-14-10_829/cytosine-NEVPT2-14-10.inp >& cytosine-NEVPT2-14-10.out
scp /scratch/cytosine-NEVPT2-14-10_829/*.gbw $USER@mgt01:/apps/users/lcz/exe11/task2/ORCA
scp /scratch/cytosine-NEVPT2-14-10_829/*.xyz $USER@mgt01:/apps/users/lcz/exe11/task2/ORCA
scp /scratch/cytosine-NEVPT2-14-10_829/*.trj $USER@mgt01:/apps/users/lcz/exe11/task2/ORCA
