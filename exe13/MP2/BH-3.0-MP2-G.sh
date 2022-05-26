#!/bin/bash
#BSUB -J intel
#BSUB -o BH-3.0-MP2-G.out
#BSUB -n 8
#BSUB -q cqueue
#BSUB -R "span[hosts=1]"

export g16root='/apps/software'
source /apps/software/g16/bsd/g16.profile
export GAUSS_SCRDIR=/scratch
/apps/software/g16/g16 < BH-3.0-MP2-G.inp > BH-3.0-MP2-G.out
