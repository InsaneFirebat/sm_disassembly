#!/bin/sh

echo "Creating FF file"
python3 tools/ff_file.py ../SM.sfc

echo "Patching FF file with asar"
cd tools
./asar-standalone --no-title-check --symbols=wla --symbols-path=../symbols.sym ../src/main.asm ../SM.sfc && echo Success!

cmp "../Super Metroid.sfc" "../SM.sfc" && echo "Matched!"
