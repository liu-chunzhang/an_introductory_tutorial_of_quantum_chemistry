#!/bin/bash
#BSUB -J intel
#BSUB -o BH-1.0-CCSD-G.out
#BSUB -n 8
#BSUB -q cqueue
#BSUB -R "span[hosts=1]"

export g16root='/apps/software'
source /apps/software/g16/bsd/g16.profile
export GAUSS_SCRDIR=/scratch
/apps/software/g16/g16 < BH-1.0-CCSD-G.inp > BH-1.0-CCSD-G.out
