#!/bin/bash
nasm  -f elf64 Sully.asm
ld -o Sully Sully.o
./Sully
