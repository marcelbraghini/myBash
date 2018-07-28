#!/bin/bash

#Funções
function Atualizar () {
   echo "Atualizando o sistema ..."
}
 
function LimparLixeira () {
   echo "Limpando a lixeira ..."
}
 
function RemoverCache () {
   echo "Removendo a cache ..."
}
 
function RepararPermissoes () {
   echo "Reparando permissões ..."
}
 
#Condições
function ValidarOpcoes () {
   clear
   if [ $1 = "1" ]; then
      LimparLixeira
   elif [ $1 = "2" ]; then
      RemoverCache
   elif [ $1 = "3" ]; then
      Atualizar
   elif [ $1 = "4" ]; then
      RepararPermissoes
   elif [ $1 = "5" ]; then
      echo -e "=================================="
      echo -e "===========| E X I T |============"
      echo -e "=================================="
      exit 1
   else
      echo -e "===================================="
      echo -e "======| Sua opção é inválida! |====="
   fi
}

#Inicio 
while true;
do
   if [ $? -ne "0" ]; then
      echo -e "======================================================"
      echo -e "===| Você não é root, execute como super-usuario! |==="
      echo -e "======================================================"
      exit 1
   fi
   echo -e "===================================="
   echo -e "===| Entre com a opção desejada |==="
   echo -e "===================================="
   echo -e "1 - Limpar lixeira"
   echo -e "2 - Remover logs de cache"
   echo -e "3 - Atualizar o sistema"
   echo -e "4 - Reparar permissões de disco"
   echo -e "5 - Sair"
   read -p "$: " op
 
   ValidarOpcoes $op
done