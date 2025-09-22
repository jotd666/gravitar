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

            if line_address in {0x54bb,0x553a,0x5b6f,0x90af,0x90b3,0xe81d,0xbbeb,0xbf1f}:
                lines[i+1] = remove_error(lines[i+1])

            if line_address in {0xe784,0xe791}:
                line = "\tSET_C_FROM_X\n" + line
                lines[i+1] = remove_error(lines[i+1])

            if line_address in {0xEF16}:
                line = remove_error(line)

            if line_address in {0xef1f,0xef25,0xef2b}:
                lines[i-1] = change_instruction("abcd\td4,d0",lines,i-1)

            if line_address == 0x94f1:
                # remove mixed code/data label:
                    lines[i-1]="out_94f1:\n"
            if line_address == 0x94dc:
                line = line.replace("command_minus_1_","out_")

            if line_address == 0xbbe7:
                line = "\tPUSH_SR\n"+line
                lines[i+1] += "\tPOP_SR\n"
            if line_address == 0x90af:
                lines[i+1] = "\tPUSH_SR\n"
            if line_address == 0x90b3:
                line = "\tPOP_SR\n" + line
            if line_address == 0xe81d and "addx" in line:
                line = "\tINVERT_XC_FLAGS\n"+line

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
