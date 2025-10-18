#!/bin/bash
echo "" > Selly_4.c
nasm -f macho64 Selly.asm -o Selly.o
ld -o Selly Selly.o -e _start -static
./Selly
cat Selly_4.c
