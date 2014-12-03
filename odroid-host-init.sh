sudo apt-get install docker.io

#docker.io in standard repos does not work on arm so download and install required packages from debian instead.
mkdir deb_temp
cd deb_temp

#install a newer perl
wget http://ftp.de.debian.org/debian/pool/main/p/perl/perl-modules_5.20.1-3_all.deb
wget http://ftp.de.debian.org/debian/pool/main/p/perl/perl-base_5.20.1-3_armhf.deb
wget http://ftp.de.debian.org/debian/pool/main/p/perl/perl_5.20.1-3_armhf.deb

sudo dpkg -i perl_5.20.1-3_armhf.deb perl-base_5.20.1-3_armhf.deb perl-modules_5.20.1-3_all.deb

#install docker.io dependancies
wget http://ftp.de.debian.org/debian/pool/main/l/lvm2/libdevmapper1.02.1_1.02.90-2_armhf.deb
wget http://ftp.de.debian.org/debian/pool/main/l/lvm2/dmsetup_1.02.90-2_armhf.deb
wget http://ftp.de.debian.org/debian/pool/main/i/init-system-helpers/init-system-helpers_1.22_all.deb

wget http://ftp.de.debian.org/debian/pool/main/d/docker.io/docker.io_1.3.2~dfsg1-1_armhf.deb

sudo dpkg -i docker.io_1.3.2~dfsg1-1_armhf.deb init-system-helpers_1.22_all.deb libdevmapper1.02.1_1.02.90-2_armhf.deb dmsetup_1.02.90-2_armhf.deb 

#output the host id.
echo "odroid server" >> /etc/profile.d/host.sh
chmod +x /etc/profile.d/host.sh

#I prefer dropbear so swap out openssh
sudo apt-get remove openssh-server
sudo apt-get install -y dropbear

#install samba
sudo apt-get install -y samba samba-common python-glade2 system-config-samba

#access windows shares / nfs
sudo apt-get install -y cifs-utils

cd ..
rm -rf deb_temp/
#for odroid only
wget http://builder.mdrjr.net/tools/kernel-update.sh

#messages for the user
echo "script complete"
echo "edit /etc/profile.d/host.sh to identify this new host when you login."
echo "edit /etc/samba/smb.conf to add any samba shares on this host."
echo "run kernel-update.sh to update the odroid kernel"
