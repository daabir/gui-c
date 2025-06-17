flags := -fno-stack-protector -O0 -Wall -std=gnu2x
flags += -m16 -ffreestanding -I include
ldflags := --nmagic --script=gui.ld
objects := main.o
xobjects := xgfx.o
NASMENV := -i include/asm/
export NASMENV

.PHONY: clean

all: gui.com

gui.com: $(objects) $(xobjects)
	ld $(ldflags) $^ -o $@

main.o: main.c
	cc $(flags) -c $^

xgfx.o: xgfx.asm
	nasm -f elf $^ -o $@

clean:
	rm -f *.o *.com