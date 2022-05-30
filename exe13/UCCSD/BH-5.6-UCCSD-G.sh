#!/bin/bash
#BSUB -J intel
#BSUB -o BH-5.6-UCCSD-G.out
#BSUB -n 8
#BSUB -q cqueue
#BSUB -R "span[hosts=1]"

export g16root='/apps/software'
source /apps/software/g16/bsd/g16.profile
export GAUSS_SCRDIR=/scratch
/apps/software/g16/g16 < BH-5.6-UCCSD-G.inp > BH-5.6-UCCSD-G.out