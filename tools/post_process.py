from shared import *

# post-conversion automatic patches, allowing not to change the asm file by hand
# when everything is stable, I use to stop using 6502 source as source, and work on the 68k file
# directly (to remove PUSH_SR...) but not too soon. It allows to change generation type, fix conversion bugs
# until only the optimizations remain (the non-optimized code generated from 6502+post processing is still correct)

# there are theoretical carry issues in B76D B7C8 B801 but the error compensates thanks to the subsequent adds
# that reset X flag, so atm no need to fix anything there.


input_read_dict = {
"p1_1000":"read_p1_inputs",
"p2_1001":"read_p2_inputs",
"p3_1005":"",
"p4_1006":"",   # no P3 and P4
"system_1002":"read_system",
"dsw1_1003":"read_dsw1",
"dsw2_1004":"read_dsw2",

}

input_write_dict = {
"irq_ack_100a":"",
"irq_ack_100b":"",
"p1_1000":"",
"p2_1001":"",
"p3_1005":"",
"p4_1006":"",   # no P3 and P4
"sound_100d":"sound_start",   # sound_start
"bankswitch_1009":"set_bank",
"scrollx_lo_100c":"set_scrollx_lo",
"scrolly_lo_100e":"set_scrolly_lo",
"scrollx_hi_1008":"set_scrollx_hi",
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
            if line_address in {0xe749,0Xe49d,0xd965,0xe523,0xe41f,0Xe229,0x54bb,0xe74c,0xe73c,0xe8e3,0xe968,
            0x553a,0x5b6f,0x90af,0x90b3,0xe81d,0xbbeb,0xbf1f,0xed8a,0xedf1,0xcd90,0x9052,0xe8fb,0xe20f,
            0xe940,0Xe98b,  # disabled, not fixed (self-tests)
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

            if line_address in {0xEF16,0x95a4}: # sed shit
                line = remove_error(line)

            if line_address in {0xef1f,0xef25,0xef2b}:
                lines[i-1] = change_instruction("abcd\td4,d0",lines,i-1)

            if line_address == 0x95A7 and "addx" in line:
                 line = change_instruction("abcd\td4,d0",lines,i)

            if line_address == 0x94f1:
                # remove mixed code/data label:
                    lines[i-1]="out_94f1:\n"
            if line_address == 0x94dc:
                line = line.replace("command_minus_1_","out_")

            if line_address == 0xbbe7:
                line = "\tPUSH_SR\n"+line
                lines[i+1] += "\tPOP_SR\n"
            elif line_address == 0x90af:
                lines[i+1] = "\tPUSH_SR\n"
            elif line_address == 0x90b3:
                line = "\tPOP_SR\n" + line
            elif line_address == 0xe81d and "addx" in line:
                line = "\tINVERT_XC_FLAGS\n"+line

            elif line_address == 0xe20d:
                line += "\tSET_X_FROM_CLEARED_C\n"

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

            elif line_address == 0xe73a:
                line += "\tSET_C_FROM_X   | retrieve lsr X flag for C\n"
            if "jump_table" in line:
                m = jmpre.search(line)
                if m:
                    ireg = m.group(2).upper()  # A or B
                    inst = m.group(1).upper()
                    reg = {"x":"A2","y":"A3"}[m.group(3)]
                    rest = re.sub(".*\"","",line)
                    line = f"\t{inst}_{ireg}_INDEXED\t{reg}{rest}"
            lines[i] = line
            i+=1

    # merge/split lines so numbers match
    lines = "".join(lines).splitlines(True)

    header = """\t.include "gravitar_data.inc"
    \t.include "breakpoint.inc"
    \t.global\tnmi_ee9e
    \t.global\treset_eea1
    \t.global\tirq_eea4



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
