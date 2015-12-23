help:
	@echo 'Help:'
	@echo 'hex: compile hex file'
	@echo 'flash: install hex file'

hex:
	avr-gcc -Os -DF_CPU=16000000 -mmcu=atmega328p -c main.cpp
	avr-gcc -DF_CPU=16000000 -mmcu=atmega328p -o main.elf main.o
	avr-objcopy -O ihex main.elf main.hex
	rm main.o
	rm main.elf

flash:
	avrdude -c arduino -p atmega328p -P COM7 -U flash:w:main.hex

program:
	avr-gcc -Os -DF_CPU=16000000 -mmcu=atmega328p -c main.c
	avr-gcc -DF_CPU=16000000 -mmcu=atmega328p -o main.elf main.o
	avr-objcopy -O ihex main.elf main.hex
	rm main.o
	rm main.elf
	avrdude -c arduino -p atmega328p -P COM7 -U flash:w:main.hex
