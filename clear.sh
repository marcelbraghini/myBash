#!/bin/bash

#Funções
function confereSistemaOperacional (){
   cod=`uname -mrs`
   export cod
   if echo "$cod" | egrep 'Linux' >/dev/null
      then
         return 1
      else
         return 0   
   fi
   #Recupero o retorno assim: 
   # valor=$(confereSistemaOperacional)
   # echo $?-mostra-> retorno || $valor-> mostra se existir echo
}

function Atualizar () {
   echo "Atualizando o sistema operacional..."
   valor=$(confereSistemaOperacional)
   if [ $? -eq 0 ]
      then
         #LINUX Chamar a atualização
         echo ""
      else
         #MAC Chamar a atualização
         echo ""
   fi
}
 
function LimparLixeira () {
   echo "Limpando sua lixeira ..."
   valor=$(confereSistemaOperacional)
   if [ $? -eq 0 ];
      then
         #LINUX Chamar a atualização
         echo ""
      else
         #MAC Chamar a atualização
         echo ""
   fi
}
 
function RemoverCache () {
   echo "Removendo a cache ..."
   valor=$(confereSistemaOperacional)
   if [ $? -eq 0 ];
      then
         #LINUX Chamar a atualização
         echo ""
      else
         #MAC Chamar a atualização
         echo ""
   fi
}
 
function RepararPermissoes () {
   echo "Reparando permissões ..."
   valor=$(confereSistemaOperacional)
   if [ $? -eq 0 ]
      then
         #LINUX Chamar a atualização
         echo ""
      else
         #MAC Chamar a atualização
         echo ""
   fi
}
 
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