#!/bin/bash

echo "" > Grace_kid.s
nasm  -f elf64 Grace.s
ld -o Grace.out Grace.o
./Grace.out
cat Grace.s > test01.txt ; ./Grace.out  ; diff test01.txt Grace_kid.s
