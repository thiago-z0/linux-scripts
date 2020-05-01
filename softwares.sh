#!/bin/bash

sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

sudo apt update && 

sudo add-apt-repository ppa:git-core/ppa 
sudo apt update
sudo apt install git

sudo apt install snapd

sudo apt install python3 docker docker-compose git build-essential libssl-dev flatpak -y &&

sudo snap install insomnia &&  
sudo snap install spotify &&
sudo snap install code --classic &&  
sudo snap install android-studio --classic &&
sudo snap install node --channel=12/stable --classic &&
sudo snap install postbird &&
sudo snap install discord &&

cd ~/Downloads/ && wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i *.deb && 

sudo docker run --name postgres -e POSTGRES_PASSWORD=docker -p 5432:5432  -d postgres:11 &&

sudo docker run --name mongo -p 27017:27017  -d mongo:4 &&

sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y 

echo "Finalizado"
