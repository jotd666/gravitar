from shared import *

import subprocess,re

import inject_symbols,post_process

inject_symbols.doit()

cmd = ["cmd","/c","6502to68k.py","-i","mot","-o","mit","gravitar_6502_syms.asm","conv.s","gravitar.inc"]

subprocess.run(cmd,cwd=src_dir)

nb_errors = post_process.doit()
if False and nb_errors:
    pass
else:

    subprocess.run(["m68k-amigaos-as","-o","gravitar.o","gravitar.68k"],cwd=src_dir,check=True)
    p = subprocess.run(["m68k-amigaos-ld","-o","test","gravitar.o"],cwd=src_dir,stderr=subprocess.PIPE)
    if p.returncode:
        errors = p.stderr.decode()
        undefined = sorted(set(re.findall("undefined reference to `(\w+)'",errors)))
        for u in undefined:
            print(u)
        print(f"{len(undefined)} undefined symbols")
