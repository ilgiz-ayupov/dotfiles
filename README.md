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
