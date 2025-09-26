import sys
from PIL import Image, ImageDraw

# https://www.youtube.com/watch?v=smStEPSRKBs

##
##
##draw = ImageDraw.Draw(im)
##draw.line((0, 0) + im.size, fill=(0xFF,0xFF,0xFF))
##draw.line((0, im.size[1], im.size[0], 0), fill=(0xFF,0xFF,0xFF))
##
##im.save("foo.png")

im = Image.new("RGB",(8192,8192))
draw = ImageDraw.Draw(im)

with open("vectors_game_over",'rb') as f:
    contents = f.read()
with open("gravitar_vector_rom.bin",'rb') as f:
    contents += f.read()

class VectorMachine:
    def __init__(self,memory):
        self.__pc = 0
        self.__memory = memory
        self.__stack = []

    def f_set_status(self):
        pass
    def f_draw(self):
        pass
    def f_unknown(self):
        pass
    def f_scale(self):
        pass
    def f_color(self):
        self.__color = self.__word & 0xF

    def f_center(self):
        pass
    def f_halt(self):
        self.__running = False
    def f_jsr(self):
        self.__stack.append(self.__pc)
        self.__pc = self.__word

    def f_jmp(self):
        self.__pc = self.__word

    def f_return(self):
        self.__pc = self.__stack.pop()

    __commands = [f_unknown,f_halt,f_unknown,f_set_status,f_center,f_jsr,f_return,f_jmp]

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
            print(f"PC = {prev_pc:04x}, command = {self.__command:01x}, arg = ${self.__word:04x}, name = {f.__name__}")
            f(self)


vm = VectorMachine(contents)
vm.run()

#print(max(xlist),max(ylist))
#im.save("out.png")