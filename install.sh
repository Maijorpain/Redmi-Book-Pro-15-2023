#!/bin/bash
cd ./fingerprint/
chmod +x install.sh
sudo /bin/sh install.sh fingerprint 
sudo dnf install -y podman
sudo podman build -t fingerprint -f Dockerfile --build-arg UNAME=$USER
DEV_PATH=$(lsusb -d 10a5:9201 | awk '{print $2"/"$4}' | tr -d :)
sudo cp ../fingerprint.service /etc/systemd/system/fingerprint.service
sudo systemctl enable fingerprint.service
sudo systemctl start fingerprint.service
