import os.path, re, sys

file = open(sys.argv[1], 'r')
out = open(os.path.splitext(sys.argv[1])[0]+'_aligned.asm', 'w')

while True:
    line = file.readline()
    if line == '':
        break
    match = re.search(';[0-9A-F]{6};', line)
    if match != None:
        start = match.start()
        if start > 73 and line[73:start] == ' '*(start-73):
            line = line[:73]+line[start:]
        elif start < 73:
            line = line[:start]+' '*(73-start)+line[start:]
    out.write(line)

file.close()
out.close()
