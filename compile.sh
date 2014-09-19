#!/bin/bash
git submodule update --init

rm -rf build/*

if [ "$1" == "arm" ]; then
	rm -rf thirdparty/jpeg
	rm -rf thirdparty/zlib
	build=release OS=kobo-cross HAVE_X11=no HAVE_JPEG=yes SYS_JPEG_CFLAGS="-I/chroot/include -DSHARE_JPEG" SYS_JPEG_LIBS="-L/chroot/lib/ -ljpeg" HAVE_ZLIB=yes SYS_ZLIB_CFLAGS="-I/chroot/include" SYS_ZLIB_LIBS="-L/chroot/lib -lz" make all -j8
else
	build=release HAVE_X11=no make all -j8
fi
