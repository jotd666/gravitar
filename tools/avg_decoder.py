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
        self.__intensity = 1
        self.__im = Image.new("RGB",(VectorMachine.WIDTH,VectorMachine.HEIGHT))
        self.__draw = ImageDraw.Draw(self.__im)

    def __hex(self,a,size):
        return f"${a:0{size}x}"

    def __address(self,a):
        return self.__hex(a*2+0x2000,4)

    def __draw_line(self,new_x,new_y):
        self.__draw.line((self.__x, self.__y, self.__x+new_x,self.__y+new_y), fill=(0xFF,0xFF,0xFF))
        self.__x+=new_x
        self.__y+=new_y

    def f_set_status(self):
        self.__color = (self.__word>>8) & 0x7
        self.__intensity = self.__word & 0xFF
        return f"color={self.__color},dbrit={self.__intensity}"

    def f_set_scale(self):
        self.__scale = self.__word & 0x7FF
        return f"scale={self.__scale}"

    def f_draw(self):
        extra_arg = self.__memory[self.__pc] + self.__memory[self.__pc]*256
        self.__pc += 2
        dy = self.__word & 0xFFF
        dx = extra_arg & 0xFFF
        if self.__word & 0x1000:
            dy = -dy
        if extra_arg & 0x1000:
            dx = -dx
        intensity = (extra_arg >> 13)

        self.__draw_line(dx,dy)

        return f"dx={dx},dy={dy},brit={intensity}"
    def f_short_draw(self):
        dy = (self.__word >> 8) & 0xF
        if dy & 0x10:
            ddd
            dy = -dy
        dx = self.__word & 0xF
        if dx & 0x10:
            ffff
            dx = -dx
        intensity = (self.__word & 0x00E0) >> 5
        self.__draw_line(dx,dy)

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
        return self.__address(self.__pc)

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
            lsb = self.__memory[self.__pc*2]
            msb = self.__memory[self.__pc*2+1]
            self.__pc += 1
            word = (lsb + msb*256)

            self.__command = word >> 12
            self.__word = word & 0x1FFF

            f = self.__commands[self.__command]
            old_stack = len(self.__stack)
            args = f(self)
            if args is None:
                raise Exception(f"{cmdname}: None args!!")
            cmdname = f.__name__[2:]
            prefix = f"PC = {self.__address(prev_pc)}, cmd = {self.__command:01x}, arg = ${self.__word:04x}, inst = {cmdname}"
            if args:
                prefix += f" {args}"
            print("--"*old_stack+prefix)




vm = VectorMachine(contents)
vm.run()

vm.dump("out.png")