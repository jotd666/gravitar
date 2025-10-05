rom_file = "../assets/mame/gravitar_rom.bin"

with open(rom_file,"rb") as f:
    contents = f.read()

def decode_msb_minus_1_table(offset,count):
    print(f"{offset:04x}:")
    noffset = offset - 0X9000
    block = contents[noffset:noffset+count*2]
    for i in range(0,2*count,2):
        addr = block[i] + block[i+1]*256 + 1
        print(f"\t.word\t${addr:04x}-1    ; ${offset+i:04x}")

decode_msb_minus_1_table(0x9053,(0x9079-0x9053)//2)

decode_msb_minus_1_table(0x9079,(0x9097-0x9079)//2)

decode_msb_minus_1_table(0xCD91,(0xCDA5-0xCD91)//2)

decode_msb_minus_1_table(0xedf2,8//2)
decode_msb_minus_1_table(0xed6A,7)

