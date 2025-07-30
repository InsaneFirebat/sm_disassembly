
@echo off

copy "Super Metroid.sfc" SM_Rumbled.sfc
"tools/asar" --no-title-check --symbols=wla --symbols-path=SM_Rumbled.sym %* src/rumble.asm SM_Rumbled.sfc && echo Success!

PAUSE
