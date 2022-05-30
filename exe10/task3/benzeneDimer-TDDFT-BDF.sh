#!/bin/bash
#BSUB -J intel
#BSUB -o benzeneDimer-TDDFT-BDF.out
#BSUB -n 8
#BSUB -q cqueue
#BSUB -R "span[hosts=1]"

export BDFHOME=/apps/software/bdf-pkg/build/bdf-pkg-full
export BDF_TMPDIR=/scratch/benzeneDimer-TDDFT-BDF_518
export USE_LIBCINT=no
export LD_LIBRARY_PATH=/apps/software/bdf-pkg/build/bdf-pkg-full/extlibs:/apps/software/bdf-pkg/build/bdf-pkg-full/libso:/apps/software/intel2019/mkl/lib/intel64:/apps/software/intel2019/compilers_and_libraries_2019/linux/lib/intel64:$LD_LIBRARY_PATH
ulimit -s unlimited
ulimit -t unlimited
export OMP_NUM_THREADS=8
export OMP_STACKSIZE=20G

/apps/software/bdf-pkg/build/bdf-pkg-full/sbin/bdfdrv.py -tmpdir /scratch/benzeneDimer-TDDFT-BDF_518 -r benzeneDimer-TDDFT-BDF.inp > benzeneDimer-TDDFT-BDF.out
rm -rf .benzeneDimer-TDDFT-BDF.wrk
