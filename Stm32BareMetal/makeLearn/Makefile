CC = arm-none-eabi-gcc
MACH = cortex-m4
CFLAG = -c -mcpu=$(MACH) -mthumb -std=gnu11 -O0 -nostdlib


build:*.c
	$(CC) $(CFLAG) -o */build *.c 

.PHONY : clean
clean:
	Remove-Item *.o