#!/bin/bash

echo "==== Перенос настроек ===="
declare -A paths
paths["alacritty"]="$HOME/.config/alacritty"
paths["bg"]="$HOME/.config/bg"
paths["fish"]="$HOME/.config/fish"
paths["fonts"]="$HOME/.fonts"
paths["tmux"]="$HOME/.tmux.conf"

for row in "${!paths[@]}"; do
  echo "Перенос настроек для: $row"
  rm -rf "${paths[$row]}"
  stow "$row"
done

echo "Выполнено!"

read -p "Перезагрузить? [Y/n]: " answer
answer=${answer:-y}
if [[ "$answer" =~ ^[Yy]$ ]]; then
  echo "Перезагрузка..."
  sudo reboot
else
  echo "Перезагрузка отклонена."
fi

