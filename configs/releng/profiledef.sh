#!/usr/bin/env bash
# shellcheck disable=SC2034

BUILD="1.0"
DATE=`date "+%B %e, %Y"`

app_name="snallinux"
iso_name="${app_name}"
iso_label="SNAL_$BUILD"
iso_publisher="Snal Linux <https://sourceforge.net/projects/snallinux/>"
iso_application="Snal Linux"
iso_version="$BUILD"
install_dir="arch"
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
