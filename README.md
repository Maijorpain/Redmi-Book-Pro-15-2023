# Redmi-Book-Pro-15-2023
# Настройка ноутбука Fedora Linux 40, KDE Plasma

Установка сканера отпечатка пальцев (протестировано в KDE Plasma)
Пока единственная возможность запустить фингерпринт в федоре и кде, это запихнуть датчик в контейнер и создать службу по поднятию этого контейнера.
Сам драйвер отпечатка пальцев взят из этого репозитория https://github.com/vrolife/modern_laptop/tree/main, я просто описал путь по его простому запуску.

Склонировать репозиторий со скриптом

```
git clone git@github.com:Maijorpain/Redmi-Book-Pro-15-2023.git
```
Сделать файл исполнямым 
```
cd ./Redmi-Book-Pro-15-2023
chmod +x install.sh
```
Запустить скрипт
```
sudo /bin/sh ./install.sh 
```
