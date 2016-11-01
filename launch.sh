#!/bin/bash
qemu-system-x86_64 \
    -enable-kvm \
    -m 2G \
    -smp 2 \
    -vga std \
    -net user,hostfwd=tcp::10022-:22 \
    -net nic \
    -drive file=hd.raw,format=raw
