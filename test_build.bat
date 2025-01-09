
@echo off

echo Creating FF file
python tools/ff_file.py ../SM.sfc

echo Patching FF file with asar
cd tools
set START=%TIME%
asar --no-title-check --symbols=wla --symbols-path=../symbols.sym ../src/main.asm ../SM.sfc
set END=%TIME%

cd ..
fc "SM.sfc" "Super Metroid.sfc"
if errorlevel 1 goto error

echo Success! This ROM matches vanilla Super Metroid

rem Benchmarking asar
rem Convert to centiseconds
set /A START=(1%START:~0,2%-100)*360000 + (1%START:~3,2%-100)*6000 + (1%START:~6,2%-100)*100 + (1%START:~9,2%-100)
set /A END=(1%END:~0,2%-100)*360000 + (1%END:~3,2%-100)*6000 + (1%END:~6,2%-100)*100 + (1%END:~9,2%-100)

rem Calculating the duration
set /A DURATION=%END%-%START%

rem Check for day rollover
if %END% LSS %START% set /A DURATION=%START%-%END%

rem Now break the centiseconds down to hours, minutes, seconds and the remaining centiseconds
set /A DURATIONH=%DURATION% / 360000
set /A DURATIONM=(%DURATION% - %DURATIONH%*360000) / 6000
set /A DURATIONS=(%DURATION% - %DURATIONH%*360000 - %DURATIONM%*6000) / 100
set /A DURATIONHS=(%DURATION% - %DURATIONH%*360000 - %DURATIONM%*6000 - %DURATIONS%*100)

rem Formatting
if %DURATIONH% LSS 10 set DURATIONH=0%DURATIONH%
if %DURATIONM% LSS 10 set DURATIONM=0%DURATIONM%
if %DURATIONS% LSS 10 set DURATIONS=0%DURATIONS%
if %DURATIONHS% LSS 10 set DURATIONHS=0%DURATIONHS%

rem Output
echo DURATION: %DURATION% in centiseconds

endlocal

PAUSE
exit

:error
echo !! FILE MISMATCH !!
PAUSE
