odroid-host-init
================

Script to install environment for an odroid docker host.

This is using the long term support ubuntu server os: http://odroid.in/ubuntu_14.04lts/ubuntu-14.04lts-server-odroid-u-20140604.img.xz
Once the new OS has come up then the idea is to wget this repository script to initialise the OS.

wget https://raw.githubusercontent.com/sihorton/odroid-host-init/master/odroid-host-init.sh
chmod +x odroid-host-init.sh
sudo ./odroid-host-init.sh
