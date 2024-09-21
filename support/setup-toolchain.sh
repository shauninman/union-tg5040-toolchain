#! /bin/sh

TOOLCHAIN_ARCH=`uname -m`
if [ "$TOOLCHAIN_ARCH" = "aarch64" ]; then
	exit
fi

SYSROOT_TAR="SDK_usr_tg5040_a133p"
TOOLCHAIN_NAME="aarch64-linux-gnu"
TOOLCHAIN_TAR="$TOOLCHAIN_NAME-7.5.0-linaro"
DOWNLOAD_URL="https://github.com/trimui/toolchain_sdk_smartpro/releases/download/20231018"
TOOLCHAIN_URL="$DOWNLOAD_URL/$TOOLCHAIN_TAR.tgz"
SYSROOT_URL="$DOWNLOAD_URL/$SYSROOT_TAR.tgz"

cd ~

wget $TOOLCHAIN_URL
wget $SYSROOT_URL

tar xf $TOOLCHAIN_TAR.tgz -C /opt
mv /opt/$TOOLCHAIN_TAR /opt/$TOOLCHAIN_NAME
rm $TOOLCHAIN_TAR.tgz

tar xf $SYSROOT_TAR.tgz
rsync -a --ignore-existing ./usr/ /opt/$TOOLCHAIN_NAME/$TOOLCHAIN_NAME/libc/usr/
rm -rf ./usr $SYSROOT_TAR.tgz
