# Make sure only root can run this script
if [ $(id -u) != 0 ]; then
   echo "This script must be run as root"
   sudo "$0" "$@"
   exit
fi

# update the system
apt-get update
apt-get upgrade -y

# install git-core
apt-get install git-core -y

# install java


# install wiringPi
git clone git://git.drogon.net/wiringPi
cd wiringPi
./build
cd ..
rm -rf wiringPi

# install rcswitch-pi
git clone https://github.com/tommyziegler/rcswitch-pi
cd rcswitch-pi
make
mkdir -p /opt/rcswitch-pi
mv sendRev sendElro /opt/rcswitch-pi/
cd ..
rm -rf rcswitch-pi
