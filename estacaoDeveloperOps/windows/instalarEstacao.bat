@echo off
rem Verifica se a variável CLIENTE_BASE existe
 if not defined COLETIVO_JAVA_WORKSPACE (
    echo A variávelCOLETIVO_JAVA_WORKSPACE não existe. Criando agora...
	rem Solicita o nome do usuário e define "Desconhecido" como valor padrão
	set /p diretorioPadrao= Deseja personalizar o seu diret�rio de trabalho? [%USERPROFILE%\coletivo_java]: 
	rem
	rem rem Se o usuário não digitar nada, o valor padrão será atribuído
	if "%diretorioPadrao%"=="" set diretorioPadrap=%USERPROFILE%\coletivo_java
        setx COLETIVO_JAVA_WORKSPACE "%USERPROFILE%\coletivo_java" /M
        echo COLETIVO_JAVA_WORKSPACE crida com sucesso
     ) else (
         echo variavel de ambiente COLETIVO_JAVA_WORKSPACE já existe com o valor: %COLETIVO_JAVA_WORKSPACE%
     )
pause

if not exist %COLETIVO_JAVA_WORKSPACE% mkdir  %COLETIVO_JAVA_WORKSPACE%
cd %COLETIVO_JAVA_WORKSPACE%
git clone https://github.com/salviof/superBitsDevOps.git
cd superBitsDevOps
git pull
cd estacaoDeveloperOps\docker
echo "Legal, já configuramos a sua pasta de trabalho e baixamos os scritps de deve ops, no preposit�rio https://github.com/salviof/superBitsDevOps.git "
echo "Agora Vamos compilar a imagem docker que ir� realizar todas opera��es de devops"
echo "seus projetos devem ser criados em  %COLETIVO_JAVA_WORKSPACE%\projetos\nomeDaEmpresa\source\nomeProjeto"

pause 

docker build -t coletivojava:developer  ./


