from shared import *

# post-conversion automatic patches, allowing not to change the asm file by hand
# when everything is stable, I use to stop using 6502 source as source, and work on the 68k file
# directly (to remove PUSH_SR...) but not too soon. It allows to change generation type, fix conversion bugs
# until only the optimizations remain (the non-optimized code generated from 6502+post processing is still correct)

# there are theoretical carry issues in B76D B7C8 B801 but the error compensates thanks to the subsequent adds
# that reset X flag, so atm no need to fix anything there.


input_read_dict = {
"input_0_7800":"read_inputs_0",
"input_1_8000":"read_inputs_1",
"input_2_8800":"read_inputs_2",

"potin_6008":"read_dsw1",
"potin_6008":"read_dsw2",
"random_600a":"get_random",

}

input_write_dict = {
"watchdog_8980":"",
"interrupt_ack_88c0":"",
"vg_stop_8880":"",
"vg_start_8840":"",
"input_2_8800":"",  # reset vector graphics engine
"pokey_6000":"",
"pokey2_6800":"",
"serial_port_control_600f":"",
"serial_port_control_680f":"",
"potgo_600b":"",
"potgo2_680b":"",
"potin_6008":"",  # audio control
"potin_6008":"",  # audio control


}


def get_line_address(line):
    try:
        toks = line.split("|")
        address = toks[1].strip(" [$").split(":")[0]
        return int(address,16)
    except (ValueError,IndexError):
        return None

def doit():
    nb_errors = 0

    # if code is generated without optimizations, turn this off!!
    optimizer_on = True

    # various dirty but at least automatic patches applying on the specific track and field code
    with open(src_dir / "conv.s") as f:
        lines = list(f)
        i = 0

        while i < len(lines):
            line = lines[i]
            line_address = get_line_address(line)

            if line_address in [0x54b6,0x553a]:
                # change cmp carry
                line += "\tINVERT_XC_FLAGS\n"

            # remove various ERROR directives that we handled somewhere else (or which were
            # false alarms)
            if line_address in {0xe749,0Xe49d,0xd965,0xe41f,0Xe229,0x54bb,0xe74c,0xe73c,0xe8e3,0xe968,0X96a9,0x99bb,0xa50c,
            0x553a,0x5b6f,0x90af,0x90b3,0xe81d,0xbbeb,0xbf1f,0xed8a,0xedf1,0xcd90,0x9052,0xe8fb,0xe20f,0x9e63,0x9e6e,0xa4f0,
            0x9e7c,0X9e87,0X9e95,0X9ea0,0Xde54,0Xe268,0x960a,0xd6d2,0xe151,0Xde85,0xdab2,0Xbfb2,0Xbfbc,0Xbc78,0xbde2,0X9fe4,
            0xbce3,0xbf05,0xa12d,0xa18c,0Xa511,0xc37f,0xA04C,0xc352,0x9abd,0x9ed7,0x9f21,0x9f46,0x9a9a,0x9eb4,0x9ebf,0x9efc,
            0xe183,0x99df,
            #0xe940,0Xe98b,  # disabled, not fixed (self-tests)
            }:
                lines[i+1] = remove_error(lines[i+1])

            # invert asl/sub instructions to preserve carry
            if line_address in [0xe522,0xe49b,0xe8f9]:
                line = lines[i-1].rstrip()+" inverted to preserve asl carry\n"
                lines[i-1] = lines[i]

            if line_address in {0xe784,0xe791}:
                line = "\tSET_C_FROM_X\n" + line
                lines[i+1] = remove_error(lines[i+1])

            if re.search("GET_ADDRESS\t.*jump_table",line):
                index = "X" if ", x" in line or ",x" in line else "Y"
                line = line.replace("+1","")
                line = line.replace("GET_ADDRESS",f"PUSH_TABLE_{index}_ADDRESS")
                lines[i+1] = "\trts   | and jump!\n\n"

            if line_address in {0xEF16,0x95a4,0xddb1,0x9687}: # sed shit
                line = remove_error(line)

            if line_address == 0x968b:
                line = remove_instruction(lines,i)  # remove SEC
                lines[i+1] = change_instruction("move.b\tfuel_used_48,d4",lines,i+1)
                lines[i+1] += "\tsbcd\td4,d0  | [...]\n"
            elif line_address in [0x9696,0x96ae]:
                line = change_instruction("moveq\t#0,d4",lines,i)
                line += "\tsbcd\td4,d0  | [...]\n"

            if line_address in {0xef1f,0xef25,0xef2b}:
                lines[i-1] = change_instruction("abcd\td4,d0",lines,i-1)

            if line_address == 0x95A7 and "addx" in line:
                 line = change_instruction("abcd\td4,d0",lines,i)

            elif line_address == 0xe181:
                line = line.replace("d0","d2") # perform asl directly on d2
                lines[i+1] = remove_instruction(lines,i+1)
            if line_address == 0x94f1:
                # remove mixed code/data label:
                    lines[i-1]="out_94f1:\n"
            if line_address == 0x94dc:
                line = line.replace("command_minus_1_","out_")

            if line_address in [0xbbe7]:
                line = "\tPUSH_SR\n"+line
                lines[i+1] += "\tPOP_SR\n"
            elif line_address == 0xc9f4:
                # make up for bug in converter
                line = "l_c9f4:\n"+line
            elif line_address == 0xe262:
                line = change_instruction("jra\tVGMSG0_e252",lines,i)
            elif line_address in [0xa50e,0xa4f2]:
                lines[i-1] = lines[i-1].replace("addx.b","add.b")  # carry is clear
            elif line_address in [0xddb8,0xddbe,0xc38a,0xc392,0xc39a]:
                lines[i-1] = lines[i-1].replace("addx.b","abcd")
            elif line_address == 0xcc89:
                # remove register restore and normal return
                for j in range(i,i-6,-1):
                    lines[j] = remove_instruction(lines,j)
                line = change_instruction("rts",lines,i)
            elif line_address == 0xE261:
                line = change_instruction("addq\t#4,sp",lines,i)
            elif line_address in [0x90af]:
                lines[i+1] = "\tPUSH_SR\n"
            elif line_address == 0xc9f3:
                lines[i+2] = remove_error(lines[i+2])
            elif line_address in [0x90b3,0xbce3,0xbde2]:
                line = "\tPOP_SR\n" + line
            elif line_address in [0xbcdc,0xbddd]:
                line += "\tPUSH_SR\n"
            elif line_address == 0xe81d and "addx" in line:
                line = "\tINVERT_XC_FLAGS\n"+line
            elif line_address == 0xe268 and "addx" in line:
                line = "\tSET_XC_FLAGS\n"+line
            elif line_address == 0xbfb7:
                lines[i+2] += "\tSET_X_FROM_C\n\tINVERT_XC_FLAGS\n"
                lines[i+3] = remove_error(lines[i+3])
            elif line_address == 0xa4f5:
                remove_error(lines[i-1])
                lines[i-1] = "\tSET_X_FROM_C\n\tINVERT_XC_FLAGS\n"
            elif line_address == 0xa4f7:
                line = "\tSET_C_FROM_X\n"+line

            elif line_address == 0xe894:
                line = remove_instruction(lines,i)
            elif line_address == 0x902b:
                line = change_instruction("jra\tl_901e",lines,i)
                for j in range(i+1,i+5):
                    lines[j] = remove_instruction(lines,j)

            elif line_address in [0xe20d]:
                line += "\tSET_X_FROM_CLEARED_C\n"
            elif line_address in [0xe987]:
                line += "\tSET_X_FROM_C\n\tINVERT_XC_FLAGS\n"

            elif line_address == 0xe150:
                line += "\tSET_C_FROM_X\n"
            elif line_address in [0xe989,0xbefe]:
                lines[i-1] = remove_error(lines[i-1])

            elif line_address == 0Xde51:
                line = line.replace("move.w","movem.w")  # preserve SR
                line += "\tPUSH_SR\n"
                lines[i+1] += "\tPOP_SR\n"
            elif line_address == 0xe749:
                line += "\tSET_X_FROM_CLEARED_C\n\tPUSH_SR\n"
            elif line_address == 0xe74c:
                line = "\tPOP_SR\n"+line
            elif line_address == 0xe74e:
                # carry is set but X is not, remove SBC (no further carry test)
                line = change_instruction("subq\t#1,d0",lines,i)

            elif line_address == 0Xe773:
                # deoptimize
                lines[i-1] = "\tSET_XC_FLAGS\n"
                lines[i-2] = ""  # remove optimization comment

            elif line_address == 0xe770:
                line = "\tCLR_XC_FLAGS\n"+line  # dec doesn't set C

            elif line_address == 0xd6cc:
                line = "\tPUSH_SR\n"+line  # move push upper
                lines[i+2] = ""

            elif line_address == 0xe73a:
                line += "\tSET_C_FROM_X   | retrieve lsr X flag for C\n"

            elif line_address == 0x9604:
                line += "\tPUSH_SR\n"
            elif line_address == 0x9609:
                line += "\tPOP_SR\n"

            elif line_address == 0Xbfbc:
                line = "\tSET_C_FROM_X\n" + line

            if "jump_table" in line:
                m = jmpre.search(line)
                if m:
                    ireg = m.group(2).upper()  # A or B
                    inst = m.group(1).upper()
                    reg = {"x":"A2","y":"A3"}[m.group(3)]
                    rest = re.sub(".*\"","",line)
                    line = f"\t{inst}_{ireg}_INDEXED\t{reg}{rest}"

            if line_address == 0xcc44:
                # disable call to ea_rom_io_mainline
                line = remove_instruction(lines,i)
                lines[i+1] = remove_instruction(lines,i+1)

            if line_address == 0xe506:
                # remove all ea_rom_io_mainline routine
                for j in range(i,len(lines)):
                    lines[j] = remove_instruction(lines,j,force=True)
                    if "[$e5f3" in lines[j]:
                        break
                line = lines[i]

            if line_address == 0xCBEA:
                # remove check/register preserve stuff from IRQ
                for j in range(i,len(lines)):
                    lines[j] = remove_instruction(lines,j,force=True)
                    if "[$cc05" in lines[j]:
                        break
                line = lines[i]

            if line_address == 0xe8b2:
                # remove all NV RAM  low-level stuff & timer
                for j in range(i,len(lines)):
                    if "[$e8cc" in lines[j]:
                        break
                    lines[j] = remove_instruction(lines,j,force=True)
                line = lines[i]

            if line_address == 0xe8cf:
                # stop after that line
                lines[i+1:] = []

            if "GET_ADDRESS" in line:
                val = line.split()[1]
                toks = line.split()
                if '|' in toks:
                    original_inst = toks[toks.index('|')+2]
                    input_dict = input_read_dict if original_inst in ["lda","bit"] else input_write_dict
                    osd_call = input_dict.get(val)
                    if osd_call is not None:
                        if input_dict == input_write_dict and original_inst not in ["sta","stx"]:
                            print(f"Unsupported {original_inst} for I/O address: {line.strip()}")
                            i += 1
                            continue
                        if osd_call:
                            if original_inst == "stx":
                                print("Unsupported {original_inst} for non-dummy I/O address: {line.strip()}")
                            line = change_instruction(f"jbsr\tosd_{osd_call}",lines,i)
                            if original_inst == "bit":
                                # bit for those special locations doesn't require d0 to be changed
                                # it even requires it NOT to be changed by the syscall
                                # here we "cheat" by copying the result of the syscall in RAM, it works because
                                # ram is mapped here, since 0x1xxx is between RAM/sprite RAM and video ram but in
                                # some smaller memory models it would not work!
                                line = f"""\tmove.w\td0,-(a7)   | save d0
\tGET_ADDRESS\t{val}
"""+line+"""\tmove.b\td0,(a0)   | update in ram so we can use BIT
\tBIT\t(a0)
\tmovem.w\t(a7)+,d0   | restore d0, preserving BIT status flags
"""
                        else:
                            line = remove_instruction(lines,i)
                        lines[i+1] = remove_instruction(lines,i+1)
                        if "stx" in line:
                            line = f"\texg\td0,d1\n{line}\texg\td0,d1\n"
                        if "sty" in line:
                            line = f"\texg\td0,d2\n{line}\texg\td0,d2\n"

            line = line.replace("\tjmp\t","\tjra\t")  # optimize branches
            lines[i] = line
            i+=1

    # merge/split lines so numbers match
    lines = "".join(lines).splitlines(True)

    header = """\t.include "gravitar_data.inc"
    \t.include "breakpoint.inc"
    \t.global\tpower_on_e83a
    \t.global\tirq_cbea



    """

    for i,line in enumerate(lines,header.count("\n")):
        line = re.sub("[\*\|].*","",line)
        if "ERROR" in line:
            nb_errors += 1
            print(i+1,line,end="")

    print(f"nb_errors: {nb_errors}")



    with open(src_dir / "gravitar.68k","w") as fw:
        fw.write(header)
        fw.writelines(lines)

    return nb_errors

if __name__ == "__main__":
    doit()
