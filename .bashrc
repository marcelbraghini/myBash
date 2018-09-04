#Atualizar o sistema
alias atualizar='sudo apt-get update && sudo apt-get upgrade'
alias mvnRun='mvn clean install -DskipTests -Dember.build.skip && mvn cargo:run'
alias mvnFast='mvn clean install -DskipTests -Dember.build.skip'
alias ember='ember server'