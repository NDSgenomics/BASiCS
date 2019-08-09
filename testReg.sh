#!/usr/bin/env bash
#$ -l h_vmem=10G
#$ -cwd
#$ -l h_rt=150:00:00

. /etc/profile.d/modules.sh
MODULEPATH=$MODULEPATH:/exports/igmm/software/etc/el7/modules

module load igmm/apps/R/3.5.0
module load igmm/compilers/gcc/5.5.0

Rscript testReg.R
