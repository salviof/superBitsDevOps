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
echo "Legal, j� configuramos a sua pasta de trabalho e baixamos os scritps de deve ops, no preposit�rio https://github.com/salviof/superBitsDevOps.git "
echo "Agora Vamos compilar a imagem docker que ir� realizar todas opera��es de devops"
echo "seus projetos devem ser criados em  %COLETIVO_JAVA_WORKSPACE%\projetos\nomeDaEmpresa\source\nomeProjeto"

pause 

docker build -t coletivojava:developer  ./


echo "arquivo env n�o encontrado em %COLETIVO_JAVA_WORKSPACE%\desenvolvedor\.env

echo "Vamos te ajudar a configurar as variaveis importantes para opera��es devops ok?"
set /p "user_input=Digite um valor (padrão:%USER_NAME%): "
if not defined user_input set "CJ_DESENVOLVEDOR_NOME=%USER_NAME%"
if defined user_input= set CJ_DESENVOLVEDOR_NOME=%user_input%;
echo 
set /p "mail_input=Digite seu email"
if not defined mail_input set CJ_DESENVOLVEDOR_EMAIL="desenvolvedorAnonimo@coletivojava.com.br"
if defined mail_input= set CJ_DESENVOLVEDOR_EMAIL=%mail_input%;
echo

set /p "mail_input=Digite seu email"
if not defined senha_input set CJ_DESENVOLVEDOR_SENHA="desenvolvedorAnonimo@coletivojava.com.br"
if defined senha_input= set CJ_DESENVOLVEDOR_SENHA=%senha_input%;
echo

echo Primeira frase >  %COLETIVO_JAVA_WORKSPACE%\desenvolvedor\.env

echo "GIT_REPOSITORIO_PROJETOS=https://github.com/salviof" >  %COLETIVO_JAVA_WORKSPACE%\desenvolvedor\.env
echo "GIT_DESENVOLVEDOR_NOME=Sálvio Furbino" >>  %COLETIVO_JAVA_WORKSPACE%\desenvolvedor\.env
echo "GIT_DESENVOLVEDOR_EMAIL=salviof@gmail.com" >>  %COLETIVO_JAVA_WORKSPACE%\desenvolvedor\.env

echo "GIT_DESENVOLVEDOR_SENHA=%CJ_DESENVOLVEDOR_SENHA%"
echo "DIRETORIO_PASTA_DE_TRABALHO=%COLETIVO_JAVA_WORKSPACE%\projetos" >>  %COLETIVO_JAVA_WORKSPACE%\desenvolvedor\.env
echo "SLUG_CLIENTE=labColetivoJava" >>  %COLETIVO_JAVA_WORKSPACE%\desenvolvedor\.env
echo "SENHA_ADMIN_INTRANET=senhaDev#123" >>  %COLETIVO_JAVA_WORKSPACE%\desenvolvedor\.env
echo "DOMINIO_PRODUCAO=localhost" >>  %COLETIVO_JAVA_WORKSPACE%\desenvolvedor\.env
echo "DOMINIO_HOMOLOGACAO=localhost" >>  %COLETIVO_JAVA_WORKSPACE%\desenvolvedor\.env
echo "ESTAGIO_PROJETO=DESENVOLVIMENTO" >>  %COLETIVO_JAVA_WORKSPACE%\desenvolvedor\.env
echo "PORTA_HOMOLOGACAO=8666" >>  %COLETIVO_JAVA_WORKSPACE%\desenvolvedor\.env
echo "PORTA_DEBUG=9666" >>  %COLETIVO_JAVA_WORKSPACE%\desenvolvedor\.env
echo "PORTA_WEB_ADMIN=8086" >>  %COLETIVO_JAVA_WORKSPACE%\desenvolvedor\.env
echo "PORTA_BANCO_DADOS=3366" >> %COLETIVO_JAVA_WORKSPACE%\desenvolvedor\.env



