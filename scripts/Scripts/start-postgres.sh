#!/bin/bash

set -Eeuo pipefail
# `-e` — выход при любой ошибке
# `-u` — ошибка при использовании неинициализированной переменной
# `-o pipefail` — ошибка в любом элементе пайпа
# `-E` — ловит ошибки внутри функций и subshell

# ===== Colors =====
RED="\033[0;31m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[1;33m"
NC="\033[0m"

# ===== Helpers =====
info()    { echo -e "${BLUE}ℹ️  $1${NC}"; }
success() { echo -e "${GREEN}✅ $1${NC}"; }
warn()    { echo -e "${YELLOW}⚠️  $1${NC}"; }
error()   { echo -e "${RED}❌ $1${NC}"; }

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
if ! command -v docker >/dev/null 2>&1; then
	error "docker не установлен"
	exit 1
fi

info "запуск postgres контейнера..."
if ! start_output=$(docker run --rm \
	-d \
	-e POSTGRES_USER=${user} \
	-e POSTGRES_PASSWORD=${passwd} \
	-e POSTGRES_DB=${dbname} \
	-p ${port}:5432 \
	-v ${volume}:/var/lib/postgresql/data \
	--name ${container} \
	${image} 2>&1); then

	error "не удалось запустить postgres контейнер"
	echo "$start_output"
	exit 1
fi

success "postgres успешно запущен:"
echo "${dns}"
