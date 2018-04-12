#!/bin/sh -eux

# Set up eth0 for pre-17.10
echo <<CFG >> /etc/network/interfaces.d/eth0.cfg
auto eth0
iface eth0 inet dhcp
CFG

# Adding a 2 sec delay to the interface up, 
# to make the dhclient happy
echo "pre-up sleep 2" >>/etc/network/interfaces;

# Seriously though eth0
sed -ie 's/GRUB_CMDLINE_LINUX="\(.*\)"/GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0 \1"/g' /etc/default/grub
update-grub

