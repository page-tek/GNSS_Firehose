TOOLCHAIN = /opt/riscv32i/bin

GCC = $(TOOLCHAIN)/riscv32-unknown-elf-gcc
OBJCOPY = $(TOOLCHAIN)/riscv32-unknown-elf-objcopy
SIZE = $(TOOLCHAIN)/riscv32-unknown-elf-size

firmware:
	$(GCC) -c start.S
	$(GCC) -nostdinc -fno-builtin -fwhole-program -Os -c firmware.c
	$(GCC) -ffreestanding -nostdlib -Wl,-Bstatic,-T,sections.lds start.o firmware.o -o firmware.elf 
	$(SIZE) firmware.elf

sim:
	$(GCC) -c start.S
	$(GCC) -nostdinc -fno-builtin -fwhole-program -Os -c sim.c
	$(GCC) -ffreestanding -nostdlib -Wl,-Bstatic,-T,sections.lds start.o sim.o -o sim.elf
	$(OBJCOPY) -O binary sim.elf sim.bin

clean:
	rm -f *.o *.elf *.bin *~
