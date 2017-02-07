#/bin/bash

# reqs: nasm, xorriso, build-essentials, grub-pc-bin

mkdir build
rm build/*
nasm -f elf64 src/multiboot_header.asm -o build/multiboot_header.o
nasm -f elf64 src/boot.asm -o build/boot.o
ld -n -o build/kernel.bin -T src/linker.ld build/multiboot_header.o build/boot.o
cp build/kernel.bin isofiles/boot
grub-mkrescue /usr/lib/grub/i386-pc -o os.iso isofiles # tell grub to create ISO using traditional BIOS for QEMU
