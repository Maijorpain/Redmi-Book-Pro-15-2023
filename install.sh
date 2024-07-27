#!/bin/bash
cd ./fingerprint/
chmod +x install.sh
./install.sh
sudo dnf install -y podman
sudo podman build -t fingerprint -f Dockerfile --build-arg UNAME=$USER
DEV_PATH=$(lsusb -d 10a5:9201 | awk '{print $2"/"$4}' | tr -d :)

SERVICE_FILE="/etc/systemd/system/fingerprint.service"

sudo bash -c "cat > $SERVICE_FILE" <<EOF
[Unit]
Description=Redmibook 15 2022 Fingerprint Driver
After=NetworkManager.service

[Service]
ExecStart=/usr/bin/podman run --privileged -v /var/run/dbus:/var/run/dbus -v /var/lib/fprint:/var/lib/fprint --device /dev/bus/usb/$DEV_PATH fingerprint
ExecStop=/bin/sh /opt/fingerprint-ocv/stop_fprint.sh

[Install]
WantedBy=multi-user.target
EOF

# Создание необходимых директорий и копирование файлов
sudo mkdir -p /opt/fingerprint-ocv
sudo cp stop_fprint.sh /opt/fingerprint-ocv/stop_fprint.sh

# Перезапуск systemd для применения изменений
sudo systemctl daemon-reload

# Включение и запуск службы
sudo systemctl enable fingerprint.service
sudo systemctl start fingerprint.service

# Проверка статуса службы
sudo systemctl status fingerprint.service
