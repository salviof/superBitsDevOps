#!/bin/bash
ls /home/superBits
cd /home/superBits 
git clone https://github.com/salviof/superBitsDevOps.git 
cd /home/superBits/superBitsDevOps 
./dependenciasAplicativosBase.sh 
./baixarDependencias.sh 
./compilarTudo.sh
cd /home/superBits 

