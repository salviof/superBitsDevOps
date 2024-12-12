#!/bin/bash
mkdir /home/superBits -p
ls /home/superBits
cd /home/superBits 
git clone https://github.com/salviof/superBitsDevOps.git 
cd /home/superBits/superBitsDevOps 
./dependenciasAplicativosBase.sh 
./baixarDependencias.sh 
./compilarTudo.sh
cd /home/superBits 

