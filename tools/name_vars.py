# todo:
# create inc file with equates
# $$DE6E multiply not replaced WTF


import re,json

address2symbol = dict()

# atm removed immediates
"""
#$16 CATRCT
#$08 CDATRC
#$10  MSTEST
"""


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
            asz = 4 if address > 0xFF else 2

            for i in range(count):
                radd = f"{r}_{address:0{asz}x}"
                if i > 0:
                    radd += f"+{i}"

                if val.startswith("#"):
                    radd = "#"+radd
                else:
                    address2symbol[address+i] = radd


with open("dict.json","w") as fr:
    json.dump(address2symbol,fr,indent=2)

with open("../src/gravitar_6502.asm") as fr:
    contents = fr.read()

address2line = dict()
# make a address => line dict
for i,line in enumerate(contents.splitlines()):
    m = re.match("([0-9A-F]{4}):",line)
    if m:
        address2line[int(m.group(1),16)] = i

def repfunc(m):
    start,address = m.groups()
    address = int(address,16)
    sym = address2symbol.get(address)
    if sym:
        return f"{start}{sym}"
    else:
        return m.group(0)  # no changes

contents = re.sub(r"([\s\(])\$([0-9A-F]{2,4})",repfunc,contents,flags=re.I)

lines = contents.splitlines(True)

unresolved = dict()

# collect the unresolved symbols
# add blank after line containing "rts" or "jmp"
lineno = 1
for i,line in enumerate(lines):
    toks = re.sub("\s*;.*","",line).split()
    if toks:
        last = toks[-1]
        if last.startswith("$"):
            prev = toks[-2]
            if (prev.startswith("b") and len(prev)==3 and prev != "bit") or prev == "jmp":
                # branch (including jmp): ignore
                pass
            else:
                unresolved[lineno] = last
        if ("jmp" in toks and "else" not in toks[-1]) or "rts" in toks:
            lines[i] += "\n"
            lineno += 1
    lineno += 1

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

nb_unresolved = set(unresolved.values())
print(f"nb unresolved symbols: {len(nb_unresolved)}")
if nb_unresolved:
    ful = min(unresolved)
    first_unresolved = unresolved[ful]
    print("first unresolved: {} at line {}".format(first_unresolved,ful+1))