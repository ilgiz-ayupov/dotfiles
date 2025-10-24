#!/bin/bash

# Завершить запущенные экземпляры polybar
killall -q polybar

# Подождать, пока процессы завершатся
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.5; done

# Запуск панели для каждого подключенного монитора
for m in $(polybar --list-monitors | cut -d":" -f1); do
  MONITOR=$m polybar --reload main &
done
