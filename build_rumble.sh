#!/bin/sh

echo "Creating FF file"
python3 tools/ff_file.py ../SM.sfc

echo "Patching FF file with asar"
./tools/asar-standalone --no-title-check --symbols=wla --symbols-path=SM_Rumble.sym $@ src/main.asm SM_Rumble.sfc && echo Success!
