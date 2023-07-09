# Конфигурационные файлы

## Zsh
Zsh (Z Shell) - это Unix-оболочка командной строки, которая является расширенной версией Bourne shell (sh) с множеством улучшений и дополнительных функций. Она предоставляет более продвинутый интерфейс командной строки, чем стандартная оболочка Bash, и может использоваться как замена Bash в большинстве случаев. Zsh поддерживает автодополнение, расширенный синтаксис командной строки, функции и многое другое. Она также имеет множество плагинов и настроек, которые позволяют пользователям настроить ее под свои нужды. Zsh является популярным выбором для пользователей Unix-подобных систем, таких как macOS и Linux

### Установка Zsh
- #### Fedora
```
sudo dnf install zsh
```
- #### Ubuntu
```
sudo apt install zsh
```

### Установка [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
```
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" 
```

### Установка дополнительных плагинов:

- #### [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    Он предлагает команды по мере ввода на основе истории и завершений.
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

- #### [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
    Этот пакет обеспечивает подсветку синтаксиса для оболочки zsh. 
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Установка [Starship](https://github.com/starship/starship)
    Минимальная, невероятно быстрая и бесконечно настраиваемая подсказка для любой оболочки!
```
curl -sS https://starship.rs/install.sh | sh
```

### Конфигурационный файл zsh
   Содержимое файла [.zshrc](https://github.com/ilgiz-ayupov/dotfiles/blob/main/.zshrc) необходимо скопировать и вставить по следующему пути:
- #### Linux
```
~/.zshrc
```

### Установить zsh по умолчанию для терминала
```
chsh -s $(which zsh)
```

## Kitty
