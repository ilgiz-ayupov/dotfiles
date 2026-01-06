#!/bin/bash

source ./utils/strict_mode.sh
source ./utils/trace.sh
source ./utils/color_output.sh

export TRACE=0

# ===== Config =====

# Docker
container="postgres-db"

# ===== Start =====
info "остановка контейнера postgres: ${container}..."

trace "проверить - запущен ли контейнер"
if ! docker ps --format "{{.Names}}" | grep "$container" >/dev/null 2>&1; then
	warn "не удалось остановить - контейнер не найден" 
	exit 1
fi

trace "остановка контейнера"
if ! out=$(docker stop ${container} >/dev/null 2>&1); then
	error "не удалось остановить:"
	echo "${out}"
	exit 1
fi

success "контейнер успешно остановлен"
