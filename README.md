## Docker 

1. Установка необходимых пакетов:
```bash
sudo apt-get install docker-engine docker-compose-v2
```

2. Добавить текущего пользователя в группу `docker`
```bash
sudo usermod -aG docker $USER
```

3. Включить службу `docker` и `containerd`
```bash
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
```

4. Перезагрузить компьютер
```bash
sudo reboot
```

5. Проверить результат
```bash
docker run hello-world
```

## Oracle SQL Developer
1. Скачать архив с [официального сайта](https://www.oracle.com/database/sqldeveloper/technologies/download/)
2. Распакоровать архив
```bash
sudo unzip <zip_архив> -d /opt
```
3. Создание ярлыка
Создать файл `/usr/share/applications/sqldeveloper.desktop` с следующим содержимым:
```ini
[Desktop Entry]
Exec=/opt/sqldeveloper/sqldeveloper.sh %U
Terminal=false
StartupNotify=false
Name=Oracle SQL Developer
Icon=sqldeveloper
Type=Application
Categories=Development;Database;
```
4. Установить необходимую версию java:
```bash
sudo apt-get install java-17-openjdk
```
5. При запуске `Oracle SQL Developer` попросит указать путь к установленному JDK.
Выбрать папку `/usr/lib/jvm/java-17-openjdk`

## Postman
1. Скачать архив с [официального сайта](https://www.postman.com/downloads/)
2. Распаковать архив
```bash
sudo mkdir -p /opt/postman
sudo tar -xzf <tar_архив> -C /opt/postman
```
3. Создание ярлыка
Создать файл `/usr/share/applications/postman.desktop` с следующим содержимым:
```ini
[Desktop Entry]
Name=Postman
Exec=/opt/postman/Postman
Comment=API Development Environment
Icon=postman
Terminal=false
StartupNotify=false
Type=Application
Categories=Development;Utility;
```

## KDE Connect
```bash
sudo apt-get install kdeconnect
```
