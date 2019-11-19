#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

usermod -s /bin/bash root
cp -aT /etc/skel/ /root/
sed -i "/runloop/d" /root/.screenrc
sed -i "/runmain/d" /root/.screenrc
chmod 700 /root
echo "root:root" | chpasswd

useradd -m snal
gpasswd -a snal users
gpasswd -a snal wheel
gpasswd -a snal audio
gpasswd -a snal video
cp -aT /etc/skel/ /home/snal/
sed -i "s/#runloop/\/home\/snal\/.bin\/runloop/" /home/snal/.screenrc
sed -i "s/#runmain/\/home\/snal\/.bin\/runmain/" /home/snal/.screenrc
chown -R snal:users /home/snal
chmod 700 /home/snal
echo "snal:snal" | chpasswd

sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers
sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

systemctl enable pacman-init.service choose-mirror.service
systemctl set-default multi-user.target
