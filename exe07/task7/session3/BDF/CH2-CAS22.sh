#!/bin/bash
#BSUB -J intel
#BSUB -o CH2-CAS22.out
#BSUB -n 8
#BSUB -q cqueue
#BSUB -R "span[hosts=1]"

export BDFHOME=/apps/software/bdf-pkg/build/bdf-pkg-full
export BDF_TMPDIR=/scratch/CH2-CAS22_266
export USE_LIBCINT=no
export LD_LIBRARY_PATH=/apps/software/bdf-pkg/build/bdf-pkg-full/extlibs:/apps/software/bdf-pkg/build/bdf-pkg-full/libso:/apps/software/intel2019/mkl/lib/intel64:/apps/software/intel2019/compilers_and_libraries_2019/linux/lib/intel64:$LD_LIBRARY_PATH
ulimit -s unlimited
ulimit -t unlimited
export OMP_NUM_THREADS=8
export OMP_STACKSIZE=20G

/apps/software/bdf-pkg/build/bdf-pkg-full/sbin/bdfdrv.py -tmpdir /scratch/CH2-CAS22_266 -r CH2-CAS22.inp > CH2-CAS22.out
rm -rf .CH2-CAS22.wrk