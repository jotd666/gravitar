from shared import *

import subprocess

import inject_symbols,post_process

inject_symbols.doit()

cmd = ["cmd","/c","6502to68k.py","-i","mot","-o","mit","gravitar_6502_syms.asm","conv.s","gravitar.inc"]

subprocess.run(cmd,cwd=src_dir)

post_process.doit()

