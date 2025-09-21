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

            if line_address in [0xd92b,0xd939]:
                # disable port 3/4, put zero
                line = change_instruction("clr.b\td0",lines,i)


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


if __name__ == "__main__":
    doit()
