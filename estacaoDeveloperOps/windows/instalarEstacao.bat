@echo off
# Verifica se a variável CLIENTE_BASE existe
 if not defined COLETIVO_JAVA_WORKSPACE (
    echo A variável CLIENTE_BASE não existe. Criando agora...
        setx COLETIVO_JAVA_WORKSPACE "%USERPROFILE%\coletivo_java" /M
        echo CLIENTE_BASE criada com sucesso!
     ) else (
         echo A variávelCOLETIVO_JAVA_WORKSPACE já existe com o valor:COLETIVO_JAVA_WORKSPACE%
     )
pause


