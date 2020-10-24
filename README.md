#Snal Linux

Welcome to Snal Linux
Simple Networked and Live

Snal is based on Arch linux <https://www.archlinux.org>, the i3 window manager <https://i3wm.org>, and Firefox web browser <https://www.mozilla.org>. It is intended to be used as a live USB image to troubleshoot hard disk, system, and network problems.

Snal is built using the archiso scripts from the archiso project, which is also used to build the official Arch ISO. The scripts were forked from archiso. Upstream changes are merged into Snal every few months.

## Prerequisites

Snal must be built on an Arch or Arch-based system. The following packages need to be installed to be able to create an image with the included scripts:

* arch-install-scripts
* dosfstools
* e2fsprogs
* libisoburn
* mtools
* squashfs-tools

For running the images in a virtualized test environment the following packages are required:

* edk2-ovmf
* qemu

For linting the shell scripts the following package is required:

* shellcheck

## Building a Snal image

    # run as root
    # make directory for building (if needed)
    mkdir -p /box
    # clean up old data
    rm -rf /box/{archiso,mkarchiso.log,out,releng,work}
    # copy snal files from cloned or unzipped snal
    cp -r /tmp/snal/{archiso,configs/releng} /box
    # cd to build dir
    cd /box
    # call mkarchiso 
    ./archiso/mkarchiso -v -w work -o out releng | tee mkarchiso.log

## Contributing

Development of Snal takes place on Sourceforge: https://sourceforge.net/projects/snallinux

If you are interested in contributing to Snal, I suggest either testing the latest build or directly contributing to Arch Linux.

## License

Snal linux is licensed under the terms of the GPL-3.0-or-later
