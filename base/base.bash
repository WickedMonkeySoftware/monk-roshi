#!/bin/bash

#set working directory
cd /vagrant

echo "Installing latest docker"
curl -sSL https://get.docker.com/ubuntu/ | sudo sh

sudo apt-get install -y unzip jq node

echo "Downloading serf"
wget https://dl.bintray.com/mitchellh/serf/0.6.4_linux_amd64.zip
unzip 0.6.4_linux_amd64.zip

echo "Starting serf"
./serf agent -node roshi &

echo "Downloading consul"
sudo docker pull progrium/consul

echo "Installing meteor"
curl https://install.meteor.com/ | sh

echo "Installing mcli tools"
curl https://raw.githubusercontent.com/practicalmeteor/meteor-mcli/master/bin/install-mcli.sh | bash

echo "Configuring cli tools"
mkdir -p /vagrant/monk/.meteor/local
mkdir -p ~/monk/.meteor/local
sudo mount --bind /home/vagrant/monk/.meteor/local/ /vagrant/monk/.meteor/local/

echo "Starting web interface"
mkdir -p /vagrant/monk-opsweb/.meteor/local
mkdir -p ~/ops/.meteor/local
sudo mount --bind /home/vagrant/ops/.meteor/local/ /vagrant/monk-opsweb/.meteor/local/
cd /vagrant/monk-opsweb
meteor &
cd /vagrant

echo "Linking serf to web interface"

./serf agent -node listener -event-handler /vagrant/serf-handler.sh -join

sudo apt-get upgrade -y