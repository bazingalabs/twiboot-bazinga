#!/bin/bash

make

PORT="usb"

PART="atmega328p"

BAUD="57600"

PROG="usbasp"

avrdude -c$PROG -P$PORT -p$PART -b$BAUD -U lfuse:w:0xe2:m -U hfuse:w:0xd8:m -U efuse:w:0x07:m -U lock:w:0x3F:m -U flash:w:twiboot.hex:i -U lock:w:0x0F:m

#avrdude -P$PORT -p$PART -B$BAUD -U lock:w:0x0F:m
# Read back hex
#avrdude -c usbasp -P usb -p atmega328p -U flash:r:contents.hex:i
# Only verify
#avrdude -cavr109 -patmega328p -P/dev/tty.usbmodem1a1231 -Uflash:v:ASCIITable.cpp.hex:i -vvvvvv