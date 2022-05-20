#!/bin/bash
#BSUB -J intel
#BSUB -o energy-UHF-Mul5.out
#BSUB -n 16
#BSUB -q cqueue
#BSUB -R "span[hosts=1]"

export g16root='/apps/software'
source /apps/software/g16/bsd/g16.profile
export GAUSS_SCRDIR=/scratch
/apps/software/g16/g16 < energy-UHF-Mul5.inp > energy-UHF-Mul5.out
