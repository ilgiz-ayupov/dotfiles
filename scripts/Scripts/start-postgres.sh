#!/bin/bash

source $HOME/Scripts/utils/strict_mode.sh
source $HOME/Scripts/utils/trace.sh
source $HOME/Scripts/utils/color_output.sh

export TRACE=0

# ===== Config =====

# Postgres
user="testuser"
passwd="testpasswd"
port=5432
dbname="test"
sslmode="disable"

dns="postgresql://${user}:${passwd}@127.0.0.1:${port}/${dbname}?sslmode=${sslmode}"

# Docker
image="postgres:15.15-alpine3.22"
volume="pgdata"
container="postgres-db"

# ===== Start =====
info "запуск контейнера postgres: ${container}..."

trace "проверить - установлен ли docker"
if ! command -v docker >/dev/null 2>&1; then
	error "docker не установлен"
	exit 1
fi

trace "запустить контейнер"
if ! out=$(
	docker run --rm \
	-d \
	-e POSTGRES_USER=${user} \
	-e POSTGRES_PASSWORD=${passwd} \
	-e POSTGRES_DB=${dbname} \
	-p ${port}:5432 \
	-v ${volume}:/var/lib/postgresql/data \
	--name ${container} \
	${image} 2>&1
); then
	error "не удалось запустить контейнер:"
	echo "$out"
	exit 1
fi

success "контейнер успешно запущен:"
echo "${dns}"
