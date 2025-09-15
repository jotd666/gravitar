# todo:
# create inc file with equates
# insert function names at proper offsets

import re

rep = []
with open("dict.txt") as f:
    for line in f:
        toks = line.split()
        if len(toks)==2:
            s,r = toks
            address = int(s.strip("#$"),16)
            sz = 4 if address > 0xFF else 2
            sre = " "+re.escape(s)+r"\b"
            radd = f"{r}_{address:0{sz}x}"
            if s.startswith("#"):
                radd = "#"+radd
            radd = " "+radd
            rep.append((sre,radd))

with open("../src/gravitar_6502.asm") as fr, open("gravitar_6502.asm","w") as fw:
    contents = fr.read()
    for s,r in rep:
        contents = re.sub(s,r,contents)
    fw.write(contents)
