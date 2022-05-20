#!/bin/bash
#BSUB -J intel
#BSUB -o stability-B3LYP.out
#BSUB -n 16
#BSUB -q cqueue
#BSUB -R "span[hosts=1]"

export g16root='/apps/software'
source /apps/software/g16/bsd/g16.profile
export GAUSS_SCRDIR=/scratch
/apps/software/g16/g16 < stability-B3LYP.inp > stability-B3LYP.out
