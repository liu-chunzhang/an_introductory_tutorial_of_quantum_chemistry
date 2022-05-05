#!/bin/bash
#BSUB -J intel
#BSUB -o 3,8-dicl-dibenzene.out
#BSUB -n 8
#BSUB -q cqueue
#BSUB -R "span[hosts=1]"

export BDFHOME=/apps/users/lcz/bdf-pkg
export BDF_TMPDIR=/scratch/3,8-dicl-dibenzene_840
export USE_LIBCINT=no
export LD_LIBRARY_PATH=/apps/users/lcz/bdf-pkg/extlibs:/apps/users/lcz/bdf-pkg/libso:/apps/software/intel2019/mkl/lib/intel64:/apps/software/intel2019/compilers_and_libraries_2019/linux/lib/intel64:$LD_LIBRARY_PATH
ulimit -s unlimited
ulimit -t unlimited
export OMP_NUM_THREADS=8
export OMP_STACKSIZE=20G

/apps/users/lcz/bdf-pkg/sbin/bdfdrv.py -tmpdir /scratch/3,8-dicl-dibenzene_840 -r 3,8-dicl-dibenzene.inp > 3,8-dicl-dibenzene.out
rm -rf .3,8-dicl-dibenzene.wrk
