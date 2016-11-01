# Adventures in Building a Distro

## Generating a disk image
Nothing special here. Created a disk image with two partitions, boot and
root. The bootloader and initrd will live in boot, and everything else goes in root
Filename is hd.raw.

## Booting... something
First things first, I wanted to get the minimum possible thing that Qemu
wouldn't yell at me about, which basically means installing a boot loader.
Small footprint + easy = Syslinux.
Process is as follows:
- Mount boot partition to `./disk-boot`
- Run `extlinux -i ./disk-boot`
- Unmount `./disk-boot`
- Embed Syslinux: `dd bs=440 count=1 conv=notrunc if=/usr/lib/syslinux/bios/mbr.bin of=hd.raw`

Bam. Bootable.

## But does it actually work?
Copying the initrd and vmlinuz files from my laptop to the boot partition
confirms that Syslinux can totally boot a real system. Sweet.

## Getting a root device and init system up and running
Where the fuck is my root device? Don't give me that "I can't find /dev/sda2" bullshit.
Fine. Whatever. Probably due to my laptop's initrd. Let's build a new one.
I grabbed a copy of my mkinitcpio.conf and modified it.
Fun fact, in your mkinitcpio hooks, `block` needs to come before `autodetect`.
I then used this to generate a new initrd, which is able to locate /dev/sda2
as the rootfs.
That's cool and all, but I want to not be relying on Arch's facilities to do
heavy lifting for me, so I'm going to build my own initramfs and load that.
Too much to detail here, but see the initramfs directory for what's going on.
Some fun discoveries:
- If your init is a shell script, you need a shell available (duh). Busybox
  isn't enough by itself. I needed to link /bin/sh to /bin/busybox to make it 
  available.

For the actual root filesystem, I'm still using Busybox, because it's a pretty
dope system. Write a quick /sbin/init file and away we go! Or at least I 
wish it were that easy. I ended up having to compile a kernel for this (I 
mean, I was going to have to do it eventually anyhow), as with just Arch's kernel,
my keyboard didn't work. I think it had something to do with mdev.

Regardless, I'm now able to pivot into the root filesystem and start up! That's
like, most of the hard stuff, right?

## Writing an init for the *real* system
Now that I'm booted (for sufficiently broad definitions of booting), I need
to basically do everything I did in the initramfs's init file, except pivot.
Been there, done that, pretty easy.
- TODO

