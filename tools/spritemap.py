import sys
import csv

snes2hex = lambda address: address >> 1 & 0x3F8000 | address & 0x7FFF
hex2snes = lambda address: address << 1 & 0xFF0000 | address & 0xFFFF | 0x808000

def romRead(n = 1, address = None):
    if address is not None:
        prevAddress = rom.tell()
        rom.seek(snes2hex(address))

    ret = int.from_bytes(rom.read(n), 'little')
    if address is not None:
        rom.seek(prev)

    return ret

def printSpritemap(labels=None):
    count = romRead(2)
    if count == 0 or count > 128:
        return False

    if labels != None:
        print(f"{labels[hex2snes(rom.tell()-2)]}:")
    print(f"    dw ${count:04X}{" "*61};{hex2snes(rom.tell()-2):06X};")
    for i in range(count):
        part0 = romRead(2)
        size = (part0 >> 15) & 1
        xOffset = part0 & 0x7FFF

        yOffset = romRead(1)

        part2 = romRead(2)
        yFlip = (part2 >> 15) & 1
        xFlip = (part2 >> 14) & 1
        priority = (part2 >> 12) & 3
        palette = (part2 >> 9) & 7
        tile = part2 & 0x1FF
        print(f"    %spritemapEntry({size}, ${xOffset:02X}, ${yOffset:02X}, {yFlip}, {xFlip}, {priority}, {palette}, ${tile:02X})")

    return True

labels = {}
with open("diztinguish/labels.csv", newline="") as csvfile:
    reader = csv.reader(csvfile)
    for row in reader:
        labels[int(row[0], 16)] = row[1]

rom = open("Super Metroid.sfc", "rb")
addr = int(sys.argv[1], 16)

rom.seek(snes2hex(addr))

while printSpritemap(labels):
    print("")
