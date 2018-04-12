#!/bin/sh -eux
export DEBIAN_FRONTEND=noninteractive

srv="http://us.archive.ubuntu.com/ubuntu"

cat <<APT > /etc/apt/sources.list
## configure apt to automatically use the closest mirror
deb $srv xenial main restricted universe multiverse
deb $srv xenial-updates main restricted universe multiverse
deb $srv xenial-backports main restricted universe multiverse
deb $srv xenial-security main restricted universe multiverse
# deb $srv xenial-proposed main restricted universe multiverse
APT

# Update the package list
apt-get -y update;
apt-get -y upgrade;

