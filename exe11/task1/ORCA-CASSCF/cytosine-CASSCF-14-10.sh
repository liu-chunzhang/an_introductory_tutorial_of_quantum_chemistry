#!/bin/bash
#BSUB -J intel
#BSUB -o cytosine-CASSCF-14-10.out
#BSUB -n 32
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/cytosine-CASSCF-14-10_425
scp $USER@mgt01:/apps/users/lcz/exe11/task1/ORCA/cytosine-CASSCF-14-10.inp /scratch/cytosine-CASSCF-14-10_425
scp $USER@mgt01:/apps/users/lcz/exe11/task1/ORCA/cytosine-RHF.gbw /scratch/cytosine-CASSCF-14-10_425
/apps/software/orca_5_0_0/orca /scratch/cytosine-CASSCF-14-10_425/cytosine-CASSCF-14-10.inp >& cytosine-CASSCF-14-10.out
scp /scratch/cytosine-CASSCF-14-10_425/*.gbw $USER@mgt01:/apps/users/lcz/exe11/task1/ORCA
scp /scratch/cytosine-CASSCF-14-10_425/*.xyz $USER@mgt01:/apps/users/lcz/exe11/task1/ORCA
scp /scratch/cytosine-CASSCF-14-10_425/*.trj $USER@mgt01:/apps/users/lcz/exe11/task1/ORCA
