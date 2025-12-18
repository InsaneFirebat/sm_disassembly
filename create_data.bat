
@echo off

set "sfc_src=Super Metroid.sfc"
if "%~1" neq "" set "sfc_src=%~1"

echo Extracting assets from original NTSC ROM
python tools/rip_assets.py "%sfc_src%" -o data || PAUSE
