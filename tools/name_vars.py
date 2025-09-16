# todo:
# create inc file with equates
# insert function names at proper offsets

import re

address2symbol = dict()

# atm removed immediates
"""
#$16 CATRCT
#$08 CDATRC
#$10  MSTEST
"""

rep = []
with open("dict.txt") as f:
    for line in f:
        toks = line.split()
        if len(toks)==2:
            s,r = toks
            if ":" in s:
                stoks = s.split(":")
                val = stoks[0]
                count = int(stoks[1])
            else:
                count = 1
                val = s

            address = int(val.strip("#$"),16)
            sz = 4 if address > 0xFF else 2

            for i in range(count):
                haddress = f"{address+i:0{sz}x}"

                sre = fr"(\s)\${haddress}\b"

                radd = f"{r}_{address:0{sz}x}"
                if i > 0:
                    radd += f"+{i}"

                if val.startswith("#"):
                    radd = "#"+radd
                else:
                    address2symbol[address+i] = radd
                radd = r"\1"+radd
                rep.append((sre,radd))


with open("../src/gravitar_6502.asm") as fr:
    contents = fr.read()

address2line = dict()
# make a address => line dict
for i,line in enumerate(contents.splitlines()):
    m = re.match("([0-9A-F]{4}):",line)
    if m:
        address2line[int(m.group(1),16)] = i

for s,r in rep:
    contents = re.sub(s,r,contents)

lines = contents.splitlines(True)

unresolved = set()

# collect the unresolved symbols
# add blank after line containing "rts" or "jmp"
for i,line in enumerate(lines):
    toks = re.sub("\s*;.*","",line).split()
    if toks:
        last = toks[-1]
        if last.startswith("$"):
            prev = toks[-2]
            if prev.startswith("b") and len(prev)==3 and prev != "bit":
                # branch: ignore
                pass
            else:
                unresolved.add(last)
        if ("jmp" in toks and "else" not in toks[-1]) or "rts" in toks:
            lines[i] += "\n"

# now insert known labels at the proper locations
for addr,lineno in address2line.items():
    symb = address2symbol.get(addr)
    if symb is not None:
        lines[lineno] = f"{symb}:\n"+lines[lineno]

# rebuild buffer
contents = "".join(lines)

with open("gravitar_6502.asm","w") as fw:
    # and save
    fw.write(contents)

print(f"nb unresolved symbols: {len(unresolved)}")