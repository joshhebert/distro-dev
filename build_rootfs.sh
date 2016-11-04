ROOTFS_DIR=./rootfs
PKG_DIR=./repo

# Clean
rm -rf $ROOTFS_DIR/*

# Create required dir structure
mkdir $ROOTFS_DIR/{proc,sys,dev}

# Copy required packages
rsync -a $PKG_DIR/busybox/pkg/* $ROOTFS_DIR
rsync -a $PKG_DIR/ubase/pkg/* $ROOTFS_DIR
rsync -a $PKG_DIR/init/pkg/* $ROOTFS_DIR
rsync -a $PKG_DIR/musl-libc/pkg/* $ROOTFS_DIR
rsync -a $PKG_DIR/linux-pam/pkg/* $ROOTFS_DIR
rsync -a $PKG_DIR/shadow/pkg/* $ROOTFS_DIR
rsync -a $PKG_DIR/libintl/pkg/* $ROOTFS_DIR

