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


with open("vectors_game_over",'rb') as f:
    contents = f.read()
with open("../assets/roms/vector_rom.bin",'rb') as f:
    contents += f.read()

class VectorMachine:
    WIDTH = 8192
    HEIGHT = 8192
    def __init__(self,memory):
        self.__pc = 0
        self.__memory = memory
        self.__stack = []
        self.__x = 0
        self.__y = 0
        self.__color = None
        self.__scale = 1

    def __address(self,a):
        return f"${a*2+0x2000:04x}"

    def f_set_status(self):
        pass
    def f_draw(self):
        extra_arg = self.__memory[self.__pc] + self.__memory[self.__pc]*256
        self.__pc += 2

    def f_short_draw(self):
        pass
    def f_unknown(self):
        pass
    def f_scale(self):
        pass
    def f_color(self):
        self.__color = self.__word & 0xF

    def f_center(self):
        self.__x = VectorMachine.WIDTH // 2
        self.__y = VectorMachine.HEIGHT // 2

    def f_halt(self):
        self.__running = False
    def f_jsr(self):
        self.__stack.append(self.__pc)
        self.__pc = self.__word
        return self.__address(self.__pc)

    def f_jmp(self):
        self.__pc = self.__word
        return self.__address(self.__pc)

    def f_return(self):
        self.__pc = self.__stack.pop()

    __commands = [f_draw,f_halt,f_short_draw,f_set_status,f_center,f_jsr,f_return,f_jmp]

    def run(self):
        self.__running = True
        while self.__running:
            prev_pc = self.__pc
            lsb = self.__memory[self.__pc*2]
            msb = self.__memory[self.__pc*2+1]
            self.__pc += 1
            word = (lsb + msb*256)

            self.__command = word >> 13
            self.__word = word & 0x1FFF

            f = self.__commands[self.__command]
            old_stack = len(self.__stack)
            args = f(self)
            cmdname = f.__name__[2:]
            prefix = f"PC = {self.__address(prev_pc)}, cmd = {self.__command:01x}, arg = ${self.__word:04x}, inst = {cmdname}"
            if args:
                prefix += f" {args}"
            print("--"*old_stack+prefix)

im = Image.new("RGB",(VectorMachine.WIDTH,VectorMachine.HEIGHT))
draw = ImageDraw.Draw(im)

vm = VectorMachine(contents)
vm.run()

#print(max(xlist),max(ylist))
#im.save("out.png")