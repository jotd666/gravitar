import sys
from PIL import Image, ImageDraw

# https://www.youtube.com/watch?v=smStEPSRKBs
# https://arcarc.xmission.com/Tech/neilw_xy.txt

##Bit Key:
##
##          X - X coordinate bits
##          Y - Y coordinate bits
##          I - Vector intensity(brightness) bits
##          A - Vector address bits
##          R - Red color bit
##          G - Green color bit
##          B - Blue color bit
##          S - Scale (size)
##          U - Unused bit

## the codes are as follows:
##
##    Opcode                     Hex      Binary
##
##    Draw relative vector.      0x00     000YYYYY YYYYYYYY IIIXXXXX XXXXXXXX
##
##    Halt                       0x20     00100000 00000000
##
##    Draw short relative vector 0x40     010YYYYY IIIXXXXX
##
##    New color/intensity        0x60     0110URGB IIIIIIII
##
##    New scale                  0x70     0111USSS SSSSSSSS
##
##    Center                     0x80     10000000 00000000
##
##    Jump to subroutine         0xA0     101AAAAA AAAAAAAA
##
##    Return from subroutine     0xC0     11000000 00000000
##
##    Jump to new address        0xE0     111AAAAA AAAAAAAA
##
##
##draw = ImageDraw.Draw(im)
##draw.line((0, 0) + im.size, fill=(0xFF,0xFF,0xFF))
##draw.line((0, im.size[1], im.size[0], 0), fill=(0xFF,0xFF,0xFF))
##
##im.save("foo.png")


with open("amiga_vectors",'rb') as f:
    contents = f.read()
with open("../assets/roms/vector_rom.bin",'rb') as f:
    rom_contents = f.read()

routine_dict = {}
offset = 0x2D48-0x800
letters = rom_contents[offset:offset+(11+26)*2]

letter_values = ["space"]+[str(i) for i in range(0,10)] + [chr(i) for i in range(ord('A'),ord('Z')+1)]

for i in range(0,len(letters),2):
    value = ((letters[i]+letters[i+1]*256) & 0xFFF)*2
    routine_dict[value+0x4000] = letter_values[i//2]

class VectorMachine:
    WIDTH = 1024
    HEIGHT = 1024
    def __init__(self,memory):
        self.__pc = 0
        self.__memory = memory
        self.__stack = []
        self.__x = 0
        self.__y = 0
        self.__color = 7
        self.__binary_scaling_factor = 1
        self.__linear_scaling_factor = 0
        self.__intensity = 1
        self.__im = Image.new("RGB",(VectorMachine.WIDTH,VectorMachine.HEIGHT))
        self.__draw = ImageDraw.Draw(self.__im)

    def __hex(self,a,size):
        return f"${a:0{size}x}"

    def __address(self,a):
        return self.__hex(a*2+0x2000,4)

    def __draw_line(self,new_x,new_y,intensity):
        r=g=b=0

        if self.__color & 1:
            b = 0xFF
        if self.__color & 2:
            g = 0xFF
        if self.__color & 4:
            r = 0xFF

        # temp
        intensity = bool(intensity)

        fill = (r,g,b)
        if intensity:
            self.__draw.line((self.__x, self.__y, self.__x+new_x,self.__y-new_y), fill=fill)
        self.__x+=new_x
        self.__y-=new_y

    def f_set_status(self):
        self.__color = (self.__word) & 0x7
        self.__intensity = (self.__word >> 8)
        return f"color={self.__color},dbrit={self.__intensity}"

    def f_set_scale(self):
        self.__binary_scaling_factor = (self.__word >> 8)& 0x7
        self.__linear_scaling_factor = (self.__word & 0xFF)
        return f"binary_scaling={self.__binary_scaling_factor}, linear_scaling={self.__linear_scaling_factor}"

    def __read_word(self):
        rval = self.__memory[self.__pc*2] + self.__memory[self.__pc*2+1]*256
        self.__pc += 1
        return rval


    def f_draw(self):
        extra_arg = self.__read_word()
        dy = self.__word & 0xFFF
        dx = extra_arg & 0xFFF
        if self.__word & 0x1000:
            dy -= 0x1000
        if extra_arg & 0x1000:
            dx -= 0x1000

        intensity = (extra_arg >> 13)
        scaling = self.__get_scaling()
        dx *= scaling
        dy *= scaling

        self.__draw_line(dx,dy,intensity)

        return f"dx={dx},dy={dy},brit={intensity}"

    def __get_scaling(self):
        return (1<<(1-self.__binary_scaling_factor)) * (1-self.__linear_scaling_factor//256)

    def f_short_draw(self):
        dy = (self.__word >> 8) & 0xF
        if self.__word & 0x1000:
            dy -= 16
        dx = self.__word & 0xF
        if self.__word & 0x10:
            dx -= 16

        scaling = self.__get_scaling()
        dx *= 2 * scaling
        dy *= 2 * scaling

        intensity = (self.__word & 0x00E0) >> 5
        self.__draw_line(dx,dy,intensity)

        return f"dx={dx},dy={dy},brit={intensity}"



    def f_center(self):
        self.__x = VectorMachine.WIDTH // 2
        self.__y = VectorMachine.HEIGHT // 2
        return ""

    def f_halt(self):
        self.__running = False
        return ""

    def f_jsr(self):
        self.__stack.append(self.__pc)
        self.__pc = self.__word
        real_pc = self.__pc*2 + 0x2000
        return f"{self.__address(self.__pc)} ({routine_dict.get(real_pc,'?')})"

    def f_jmp(self):
        self.__pc = self.__word
        return self.__address(self.__pc)

    def f_return(self):
        self.__pc = self.__stack.pop()
        return ""

    __commands = [f_draw,f_draw,f_halt,f_halt,f_short_draw,f_short_draw,f_set_status,f_set_scale,f_center,f_center,f_jsr,f_jsr,f_return,f_return,f_jmp,f_jmp]

    def dump(self,filename):
        self.__im.save(filename)

    def run(self):
        self.__running = True

        while self.__running:
            prev_pc = self.__pc
            word = self.__read_word()

            self.__command = word >> 12
            self.__word = word & 0x1FFF

            f = self.__commands[self.__command]
            old_stack = len(self.__stack)
            cmdname = f.__name__[2:]
            prefix = f"PC = {self.__address(prev_pc)}, cmd = {self.__command:01x}, arg = ${self.__word:04x}, inst = {cmdname}"
            print("--"*old_stack+prefix,end="")
            args = f(self)
            if args is None:
                raise Exception(f"{cmdname}: None args!!")
            if args:
                print(f" {args}")
            else:
                print()


# VGMSGA aka vg_letters_table at $4d48
##contents = bytearray(0x800)
##short_command = [0x00,0x80,0x3F,0xB6,0x3B,0xB6,0x3F,0xB6,0x3B,0xB6,0x20,0x20,0x00,0x00]
##contents[0:len(short_command)] = short_command

contents += rom_contents
vm = VectorMachine(contents)
vm.run()

vm.dump("out.png")