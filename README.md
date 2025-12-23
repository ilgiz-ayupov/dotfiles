## В самом начале...

### Включаем sudo
```bash
su -
```

```bash
control sudowheel enabled
```

```bash
exit
```

### Базовые пакеты-утилиты
```bash
sudo apt-get install -y \
    stow \
    git \
    gitk \
    fish \
    tmux \
    tree \
    neovim \
    xclip \
    firefox \
    chromium \
    fastfetch \
    eepm \
    openssl \
    gcc 
```

### Fish

```bash
sudo nvim /etc/passwd
```
Поиск своего пользователя и замена `/bin/bash` на `/usr/bin/fish`

Установка starship:
```bash
curl -sS https://starship.rs/install.sh | sh
```

### Обновление системы
```bash
sudo apt-get update && sudo apt-get dist-upgrade -y && sudo update-kernel && flatpak update -y && sudo apt-get clean
```

### Linux ядро

#### Удаляем неиспользуемые ядра
```bash
sudo remove-old-kernels
```

или сразу всё ненужное
```bash
sudo remove-old-kernels -a
```

### NVIDIA
```bash
sudo epm play switch-to-nvidia
```

### Flatpak

```bash
sudo apt-get update
```

```bash
sudo apt-get install flatpak flatpak-repo-flathub
```

## Внешний вид

### Gnome tweaks

```bash
sudo apt-get install gnome-tweaks
```

### Иконки Papirus

```bash
sudo apt-get install papirus-icon-theme
```

## Gnome расширения

### Менеджер расширений

```bash
sudo apt-get install gnome-extension-manager
```

## Приложения

### Alacritty

```bash
sudo apt-get install alacritty
```

### VsCode

```bash
sudo epm play code
```

### Docker 

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

### Golang
1. Скачать архив с [официального сайта](https://go.dev/dl/)
2. Удалить текущую версию

```bash
sudo rm -rf /usr/local/go
```

3. Распаковать архив

```bash
sudo tar -C /usr/local -xzf <targz_архив>
```

4. Добавить путь до Golang в PATH

```bash
export PATH=$PATH:/usr/local/go/bin
```

5. Проверить результат

```bash
go version
```

### Timeshift

```bash
sudo apt-get install timeshift
```


### Oracle SQL Developer
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

### Postman
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

### KDE Connect
```bash
sudo apt-get install kdeconnect
```

### AyuGram Desktop
```bash
sudo apt-get install ayugram-desktop
```

### Telegram
```bash
flatpak install flathub org.telegram.desktop
```

### Discord
```bash
flatpak install flathub com.discordapp.Discord
```

### OnlyOffice
```bash
flatpak install flathub org.onlyoffice.desktopeditors
```

### Flatseal
```bash
flatpak install flathub com.github.tchx84.Flatseal
```

