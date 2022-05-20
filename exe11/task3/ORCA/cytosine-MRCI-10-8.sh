#!/bin/bash
#BSUB -J intel
#BSUB -o cytosine-MRCI-10-8.out
#BSUB -n 32
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/cytosine-MRCI-10-8_289
scp $USER@mgt01:/apps/users/lcz/exe11/task3/ORCA/cytosine-MRCI-10-8.inp /scratch/cytosine-MRCI-10-8_289
scp $USER@mgt01:/apps/users/lcz/exe11/task3/ORCA/cytosine-RHF.gbw /scratch/cytosine-MRCI-10-8_289
/apps/software/orca_5_0_0/orca /scratch/cytosine-MRCI-10-8_289/cytosine-MRCI-10-8.inp >& cytosine-MRCI-10-8.out
scp /scratch/cytosine-MRCI-10-8_289/*.gbw $USER@mgt01:/apps/users/lcz/exe11/task3/ORCA
scp /scratch/cytosine-MRCI-10-8_289/*.xyz $USER@mgt01:/apps/users/lcz/exe11/task3/ORCA
scp /scratch/cytosine-MRCI-10-8_289/*.trj $USER@mgt01:/apps/users/lcz/exe11/task3/ORCA
