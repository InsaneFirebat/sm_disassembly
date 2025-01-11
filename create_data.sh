#!/bin/sh

sfc_src="Super Metroid.sfc"
if [ $# -ne 0 ]; then
    sfc_src="$@"
fi

echo "Extracting assets from original ROM"
python3 tools/rip_assets.py "${sfc_src}" -o data
