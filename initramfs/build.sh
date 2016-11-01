cd ./initramfs && find . | cpio -H newc -o | gzip > ../initramfs.gz
