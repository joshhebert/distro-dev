Really, I don't know where I'm going with this. This is toeing the line between
Linux-From-Scratch and Fuck-It-I'm-Writing-My-Own-Distro. Check out process.md,
where I'm documenting this wonderful journey through the land of init systems,
block devices, and initramfs.

By the end of this, I'd like to have a fully functioning distro that I can 
reliably build and know inside and out. I may not have many goals, but I do 
have a few:
    1. No SystemD. I'm using BusyBox for init and OpenRC for daemon management
    2. No GlibC. It's huge, it's crusty, and I want nothing to do with it. I'll be
       using musl libC
    3. No kernel patches by design. I don't want to be relying on workarounds unless
       there's a very _very_ good reason
    4. I want to follow the general philosophy of stali as much as possible, i.e.
       statically link what I can, and have a more sane filesystem layout.
    5. Eventually become a platform for the package manager I'm writing in
       parallel with this.
