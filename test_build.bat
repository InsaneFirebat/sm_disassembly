
@echo off

set "sfc_src=Super Metroid.sfc"
if "%~1" neq "" set "sfc_src=%~1"

echo Creating FF file
python tools/ff_file.py ../SM.sfc

echo Patching FF file with asar
"tools/asar" --no-title-check --symbols=wla --symbols-path=symbols.sym src/main.asm SM.sfc

PAUSE
