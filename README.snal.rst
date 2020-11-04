=======
Snal Linux
=======

The Snal Linux  project is made possible by heavy lifting of the Archiso project.
Currently creating the images is only supported on Arch Linux.

Requirements
============

The following packages need to be installed to be able to create an image with the included scripts:

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

Profiles
========

Archiso comes with two profiles: **baseline** and **releng**. While both can serve as starting points for creating
custom live media, **releng** is used to create the monthly installation medium.
They can be found below `configs/baseline/ <configs/baseline/>`_  and `configs/releng/ <configs/releng/>`_
(respectively). Both profiles are defined by files to be placed into overlays (e.g. *airootfs* -> *the image's /*).

Snal Linux is built from the **releng** profile and maintains a fork of archiso for that purpose.

Read `README.profile.rst <README.profile.rst>`_ to learn more about how to create profiles.

Create images
=============

From a clone of the git repo, a Snal Linux image can be built using the scripts from Archiso.

# run as root
# make directory for building
mkdir -p /box
# clean up old data
rm -rf /box/{archiso,mkarchiso.log,out,releng,work}
# copy snal files from cloned or unzipped snal
cp -r /tmp/snal/{archiso,configs/releng} /box
# cd to build dir
cd /box
# call mkarchiso 
./archiso/mkarchiso -v -w work -o out releng | tee mkarchiso.log



Contribute
==========

Development of archiso takes place on Arch Linux' Gitlab: https://gitlab.archlinux.org/archlinux/archiso

All past and present authors of archiso are listed in `AUTHORS <AUTHORS.rst>`_.

Development of Snal Linux takes place at the Snal Sourceforge page: https://sourceforge.net/projects/snallinux/

License
=======

Archiso is licensed under the terms of the **GPL-3.0-or-later** (see `LICENSE <LICENSE>`_).

Snal Linux is also licensed under the terms of the **GPL-3.0-or-later** ( see `LICENSE <LICENSE>`_).
