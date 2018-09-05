#!/bin/bash

#=====| FUNÇÕES |=====
function confereSistemaOperacional (){
   #Guardo o resultado do método que busca as informações do sistema
   cod=`uname -mrs`
   #Verifico se possui uma string linux dentro do resultado
   if echo "$cod" | egrep 'Linux' >/dev/null
      then
         #Caso tenha linux devolve true
         return 1
      else
         #Caso não seja devolve false
         return 0   
   fi
   #Recupero o retorno assim: 
   # valor=$(confereSistemaOperacional)
   # echo $?-mostra-> retorno || $valor-> mostra se existir echo
}

function Atualizar () {
   echo "Atualizando o sistema operacional..."
   #Chama o método que confere qual o sistema
   valor=$(confereSistemaOperacional)
   #Confere se é true ou false
   if [ $? -eq 1 ]
      then
         #LINUX Chamar a atualização
         `sudo apt update`
         `sudo apt upgrade`
         echo "Seu sistema é Linux"
      else
         #MAC Chamar a atualização
         echo "Seu sistema é Mac"
   fi
}
 
function LimparLixeira () {
   echo "Limpando sua lixeira ..."
   #Chama o método que confere qual o sistema
   valor=$(confereSistemaOperacional)
   #Confere se é true ou false
   if [ $? -eq 1 ];
      then
         #LINUX Chamar a atualização
         `sudo rm -rf /home/marcelb/.local/share/Trash/files/`
         echo "Seu sistema é Linux"
      else
         #MAC Chamar a atualização
         echo "Seu sistema é Mac"
   fi
}
 
function RemoverCache () {
   echo "Removendo a cache ..."
   #Chama o método que confere qual o sistema
   valor=$(confereSistemaOperacional)
   #Confere se é true ou false
   if [ $? -eq 1 ];
      then
         #LINUX Chamar a atualização
         echo "Seu sistema é Linux"
      else
         #MAC Chamar a atualização
         echo "Seu sistema é Mac"
   fi
}
 
function RepararPermissoes () {
   echo "Reparando permissões ..."
   #Chama o método que confere qual o sistema
   valor=$(confereSistemaOperacional)
   #Confere se é true ou false
   if [ $? -eq 1 ]
      then
         #LINUX Chamar a atualização
         echo "Seu sistema é Linux"
      else
         #MAC Chamar a atualização
         echo "Seu sistema é Mac"
   fi
}

function OpcaoInvalida (){
   echo -e "===================================="
   echo -e "======| Sua opção é inválida! |====="
}

function MenuInicial (){
   echo -e "===================================="
   echo -e "===| Entre com a opção desejada |==="
   echo -e "===================================="
   echo -e "1 - Limpar lixeira"
   echo -e "2 - Remover logs de cache"
   echo -e "3 - Atualizar o sistema"
   echo -e "4 - Reparar permissões de disco"
   echo -e "5 - Sair"
}

function Sair (){
   echo -e "=================================="
   echo -e "=========| S A I N D O |=========="
   echo -e "=================================="
}

function MensagemRoot() {
   echo -e "======================================================"
   echo -e "===| Você não é root, execute como super-usuário! |==="
   echo -e "======================================================"
}
 
function ValidarOpcoes () {
   #Limpo a tela
   clear
   if [ $1 = "1" ]; then
      LimparLixeira
   elif [ $1 = "2" ]; then
      RemoverCache
   elif [ $1 = "3" ]; then
      Atualizar
   elif [ $1 = "4" ]; then
      RepararPermissoes
   #Sair da aplicação
   elif [ $1 = "5" ]; then 
      Sair
      exit 1
   #Caso seja uma opção inválida
   else
      OpcaoInvalida
   fi
}

#=====| MENU PRINCIPAL |=====
clear
while true;
do
   #Confere se o usuário é o root
   if [ $? -ne "0" ]; then
      MensagemRoot
      exit 1
   fi
   #Cria o menu
   MenuInicial
   read -p "$: " op
 
   #Verifico se a entrada não é vazia
   if [[ -z "${op}" ]]; 
   then
      clear
      OpcaoInvalida
   else
      #Chama as funções de acordo com a opção escolhida
      ValidarOpcoes $op
   fi

done