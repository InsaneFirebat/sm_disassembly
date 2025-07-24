
@echo off

echo Creating FF file
python tools/ff_file.py ../SM.sfc

echo Patching FF file with asar
"tools/asar" --no-title-check --symbols=wla --symbols-path=SM_Rumble.sym %* src/main.asm SM_Rumble.sfc && echo Success!

PAUSE
