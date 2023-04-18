#!/bin/sh
#PBS -l nodes=node01:ppn=4
#PBS -q node1
#PBS -N tanaka
cd $PBS_O_WORKDIR
ulimit -s unlimited
mpiexec.hydra -np 4 /home/public/01.solver/01.coupling/07.MG/ver4.9.1_20160822/a.3d-mg10-opt
date
hostname