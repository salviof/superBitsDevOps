@echo off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)

for /f "skip=2 delims=, tokens=1,2,3,4" %%L in ('wmic nic where "netenabled=true" get macaddress^,index^,netconnectionid^,productname /format:csv') do @for /f "skip=2 delims={}, tokens=2" %%A in ('wmic nicconfig where "index=%%M" get ipaddress^,ipsubnet ^/format:csv') do (
echo %%N
set result=%%N
)
call :colorEcho 06 %result%
goto end


:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1


:end
pause
exit