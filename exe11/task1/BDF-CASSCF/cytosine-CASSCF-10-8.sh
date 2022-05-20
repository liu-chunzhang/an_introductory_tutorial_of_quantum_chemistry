#!/bin/bash
#BSUB -J intel
#BSUB -o cytosine-CASSCF-10-8.out
#BSUB -n 16
#BSUB -q cqueue
#BSUB -R "span[hosts=1]"

export BDFHOME=/apps/software/bdf-pkg/build/bdf-pkg-full
export BDF_TMPDIR=/scratch/cytosine-CASSCF-10-8_614
export USE_LIBCINT=no
export LD_LIBRARY_PATH=/apps/software/bdf-pkg/build/bdf-pkg-full/extlibs:/apps/software/bdf-pkg/build/bdf-pkg-full/libso:/apps/software/intel2019/mkl/lib/intel64:/apps/software/intel2019/compilers_and_libraries_2019/linux/lib/intel64:$LD_LIBRARY_PATH
ulimit -s unlimited
ulimit -t unlimited
export OMP_NUM_THREADS=16
export OMP_STACKSIZE=20G

/apps/software/bdf-pkg/build/bdf-pkg-full/sbin/bdfdrv.py -tmpdir /scratch/cytosine-CASSCF-10-8_614 -r cytosine-CASSCF-10-8.inp > cytosine-CASSCF-10-8.out
rm -rf .cytosine-CASSCF-10-8.wrk
