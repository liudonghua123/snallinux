#!/usr/bin/env bash
# shellcheck disable=SC2034

BUILD="1.2"
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
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/headl"]="0:0:755"
  ["/usr/local/bin/hr"]="0:0:755"
  ["/usr/local/bin/i3resize"]="0:0:755"
  ["/usr/local/bin/ifup"]="0:0:755"
  ["/usr/local/bin/launcher"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/usr/local/bin/locker"]="0:0:755"
  ["/usr/local/bin/pacver"]="0:0:755"
  ["/usr/local/bin/portalassistant"]="0:0:755"
  ["/usr/local/bin/runirssi"]="0:0:755"
  ["/usr/local/bin/runkeepalive"]="0:0:755"
  ["/usr/local/bin/runloop"]="0:0:755"
  ["/usr/local/bin/runmail"]="0:0:755"
  ["/usr/local/bin/runmain"]="0:0:755"
  ["/usr/local/bin/runmixer"]="0:0:755"
  ["/usr/local/bin/runroot"]="0:0:755"
  ["/usr/local/bin/runweb"]="0:0:755"
  ["/usr/local/bin/taill"]="0:0:755"
  ["/usr/local/bin/tildone"]="0:0:755"
  ["/usr/local/bin/tilup"]="0:0:755"
  ["/usr/local/bin/whenup"]="0:0:755"
)
