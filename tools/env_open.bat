@echo off
rem C:\Program Files\Notepad++
start notepad++ -multiInst -nosession dict.txt ..\assets\mame\sources\version-3\LOONYM.MAC
rem start notepad++ -multiInst -nosession dict.txt
bcomp ..\src\gravitar_6502.asm gravitar_6502.asm
