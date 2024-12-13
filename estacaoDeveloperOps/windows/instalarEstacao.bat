@echo off
rem Verifica se a variÃ¡vel CLIENTE_BASE existe
 if not defined COLETIVO_JAVA_WORKSPACE (
    echo A variÃ¡velCOLETIVO_JAVA_WORKSPACE nÃ£o existe. Criando agora...
	rem Solicita o nome do usuÃ¡rio e define "Desconhecido" como valor padrÃ£o
	set /p diretorioPadrao= Deseja personalizar o seu diretÃrio de trabalho? [%USERPROFILE%\coletivo_java]: 
	rem
	rem rem Se o usuÃ¡rio nÃ£o digitar nada, o valor padrÃ£o serÃ¡ atribuÃ­do
	if "%diretorioPadrao%"=="" set diretorioPadrap=%USERPROFILE%\coletivo_java
        setx COLETIVO_JAVA_WORKSPACE "%USERPROFILE%\coletivo_java" /M
        echo COLETIVO_JAVA_WORKSPACE crida com sucesso
     ) else (
         echo variavel de ambiente COLETIVO_JAVA_WORKSPACE jÃ¡ existe com o valor: %COLETIVO_JAVA_WORKSPACE%
     )
pause

if not exist %COLETIVO_JAVA_WORKSPACE% mkdir  %COLETIVO_JAVA_WORKSPACE%
cd %COLETIVO_JAVA_WORKSPACE%
git clone https://github.com/salviof/superBitsDevOps.git
cd superBitsDevOps
git pull
cd estacaoDeveloperOps\docker
echo "Legal, jÃ¡ configuramos a sua pasta de trabalho e baixamos os scritps de deve ops, no prepositÃrio https://github.com/salviof/superBitsDevOps.git "
echo "Agora Vamos compilar a imagem docker que irÃ realizar todas operaÃÃes de devops"
echo "seus projetos devem ser criados em  %COLETIVO_JAVA_WORKSPACE%\projetos\nomeDaEmpresa\source\nomeProjeto"

pause 

docker build -t coletivojava:developer  ./


