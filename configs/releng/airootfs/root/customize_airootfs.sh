#!/bin/bash

set -e -u

BUILD="0.3"

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

usermod -s /bin/bash root
cp -aT /etc/skel/ /root/
chmod 700 /root
echo "root:root" | chpasswd

useradd -m snal
gpasswd -a snal users
gpasswd -a snal wheel
gpasswd -a snal audio
gpasswd -a snal video
cp -aT /etc/skel/ /home/snal/
sed -i "s/#runroot/\/home\/snal\/.bin\/runroot/" /home/snal/.screenrc
sed -i "s/#runweb/\/home\/snal\/.bin\/runweb/" /home/snal/.screenrc
sed -i "s/#runirssi/\/home\/snal\/.bin\/runirssi/" /home/snal/.screenrc
sed -i "s/#runloop/\/home\/snal\/.bin\/runloop/" /home/snal/.screenrc
sed -i "s/#runmain/\/home\/snal\/.bin\/runmain/" /home/snal/.screenrc
chown -R snal:users /home/snal
chmod 700 /home/snal
echo "snal:snal" | chpasswd

sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers
sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i '/snalrepo/,+2d' /etc/pacman.conf
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

cat <<- EOF > /etc/os-release
NAME="Snal Linux"
PRETTY_NAME="Snal Linux"
ID=snal
BUILD_ID="$BUILD"
ANSI_COLOR="0;36"
HOME_URL="https://sourceforge.net/projects/snallinux/"
DOCUMENTATION_URL="https://sourceforge.net/p/snallinux/wiki/Home/"
SUPPORT_URL="https://sourceforge.net/p/snallinux/wiki/Home/"
LOGO=snallinux
EOF

cat $BUILD > /etc/snal-release

systemctl enable pacman-init.service choose-mirror.service
systemctl set-default multi-user.target
