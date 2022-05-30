#!/bin/bash
#BSUB -J intel
#BSUB -o trans-1,3-bivinyl-cas44-ccpvtz.out
#BSUB -n 8
#BSUB -q cqueue
#BSUB -R "span[hosts=1]"

export BDFHOME=/apps/users/lcz/bdf-pkg
export BDF_TMPDIR=/scratch/trans-1,3-bivinyl-cas44-ccpvtz_746
export USE_LIBCINT=no
export LD_LIBRARY_PATH=/apps/users/lcz/bdf-pkg/extlibs:/apps/users/lcz/bdf-pkg/libso:/apps/software/intel2019/mkl/lib/intel64:/apps/software/intel2019/compilers_and_libraries_2019/linux/lib/intel64:$LD_LIBRARY_PATH
ulimit -s unlimited
ulimit -t unlimited
export OMP_NUM_THREADS=8
export OMP_STACKSIZE=20G

/apps/users/lcz/bdf-pkg/sbin/bdfdrv.py -tmpdir /scratch/trans-1,3-bivinyl-cas44-ccpvtz_746 -r trans-1,3-bivinyl-cas44-ccpvtz.inp > trans-1,3-bivinyl-cas44-ccpvtz.out
rm -rf .trans-1,3-bivinyl-cas44-ccpvtz.wrk
