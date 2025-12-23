#!/bin/bash

set -e

echo "📥 Шаг 1: Обновляем удалённые ссылки (git fetch --prune)..."
git fetch --prune

echo "🧹 Шаг 2: Удаляем локальные ветки, у которых удалённый аналог удалён..."
for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do
  echo "  ➤ Удаление ветки $branch"
  git branch -d "$branch" || echo "    ⚠️ Не удалось удалить ветку $branch (возможно, не слита)"
done

echo "🚮 Шаг 3: (опционально) Удаляем все локальные ветки, которых нет в origin..."
read -p "❓ Удалять все локальные ветки, которых нет в origin? (Y/n): " answer
if [[ "$answer" == "y" || "$answer" == "Y" || "$answer" == "" ]]; then
  for branch in $(git branch | sed 's/\*//g' | sed 's/ //g'); do
    if ! git show-ref --verify --quiet "refs/remotes/origin/$branch"; then
      echo "  ➤ Удаляем не отслеживаемую ветку $branch"
      git branch -D "$branch"
    fi
  done
else
  echo "⏭️ Пропускаем шаг 3"
fi

echo "🔄 Шаг 4: Обновляем все отслеживаемые локальные ветки..."
current_branch=$(git rev-parse --abbrev-ref HEAD)
for branch in $(git for-each-ref --format='%(refname:short)' refs/heads/); do
  echo "  ➤ Обновляем ветку $branch"
  git checkout "$branch" >/dev/null 2>&1
  git pull --ff-only || echo "    ⚠️ Не удалось подтянуть ветку $branch"
done
git checkout "$current_branch" >/dev/null 2>&1
echo "✅ Вернулись на ветку $current_branch"

echo "🎉 Готово!"

