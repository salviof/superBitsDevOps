#!/bin/bash
#Garante que o interpretador utilizado será BashScript (nescessário em alguns casos)
# Este script depende do módulo Super-Bits DevOps encontrado em: https://github.com/salviof/superBitsDevOps

ARGUMENTOS_ESPERADOS=2
diretorioChamada=$1
nomeScript=$2


# Proteção contra execução do script sem enviar parametro nescessários
if [ $# -ne $ARGUMENTOS_ESPERADOS ]
then
  alerta "Especifique o nome do cliente, e do projeto $0 ;) "
  exit $E_BADARGS
fi
# Chamando funções do core
source /home/superBits/superBitsDevOps/core/coreSBBash.sh
#
