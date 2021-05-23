@set "default_threads=2"

@echo off
if not exist data mkdir data
cd data
IF "%1"=="" goto:EOF
IF /I "%1"=="-start" goto start
IF /I "%1"=="-stop" goto stop
goto:EOF

:start
IF "%2"=="" set "CPU=1"
SET "CPU=%2"
(
echo %CPU%
)>data
start start.vbs
timeout 1 /nobreak >nul
echo.
echo Now mining!^!
echo Use: "-stop" to stop mining...
echo.
goto:EOF

:stop
taskkill /F /IM miner.exe >nul
taskkill /F /IM cmd.exe >nul
goto:EOF

:open
echo Not argument detected...
set "CPU=%default_threads%"
echo Using %CPU% core(s)...
(
echo %CPU%
)>data
start start.vbs
timeout 1 /nobreak >nul
echo Now mining!^!
echo Use: "-stop" to stop mining...
echo.
pause
exit