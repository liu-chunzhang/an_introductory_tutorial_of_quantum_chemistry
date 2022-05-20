#!/bin/bash
#BSUB -J intel
#BSUB -o cytosine-MRCI-14-10.out
#BSUB -n 32
#BSUB -q cqueue
#BSUB -R "span[hosts=1]"

export BDFHOME=/apps/software/bdf-pkg/build/bdf-pkg-full
export BDF_TMPDIR=/scratch/cytosine-MRCI-14-10_213
export USE_LIBCINT=no
export LD_LIBRARY_PATH=/apps/software/bdf-pkg/build/bdf-pkg-full/extlibs:/apps/software/bdf-pkg/build/bdf-pkg-full/libso:/apps/software/intel2019/mkl/lib/intel64:/apps/software/intel2019/compilers_and_libraries_2019/linux/lib/intel64:$LD_LIBRARY_PATH
ulimit -s unlimited
ulimit -t unlimited
export OMP_NUM_THREADS=32
export OMP_STACKSIZE=50G

/apps/software/bdf-pkg/build/bdf-pkg-full/sbin/bdfdrv.py -tmpdir /scratch/cytosine-MRCI-14-10_213 -r cytosine-MRCI-14-10.inp > cytosine-MRCI-14-10.out
rm -rf .cytosine-MRCI-14-10.wrk
