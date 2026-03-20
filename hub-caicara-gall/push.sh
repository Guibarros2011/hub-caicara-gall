#!/bin/bash
# ╔══════════════════════════════════════════════╗
# ║  AGENTE DE DEPLOY — Hub Caicara Gall         ║
# ║  Uso: ./push.sh "descrição da alteração"     ║
# ╚══════════════════════════════════════════════╝

set -e
MSG="${1:-atualização automática do site}"

echo ""
echo "🔌 Hub Caicara Gall — Deploy Automático"
echo "─────────────────────────────────────────"
echo "📦 Commit: $MSG"
echo ""

# Verifica se é um repo git
if [ ! -d ".git" ]; then
  echo "🔧 Inicializando repositório Git..."
  git init
  git remote add origin https://github.com/Guibarros2011/hub-caicara-gall.git
  git branch -M main
fi

# Verifica se remote já existe
if ! git remote get-url origin &>/dev/null; then
  git remote add origin https://github.com/Guibarros2011/hub-caicara-gall.git
fi

echo "📋 Arquivos alterados:"
git status --short

echo ""
git add -A
git commit -m "🚀 $MSG" --allow-empty

echo ""
echo "⬆️  Enviando para GitHub..."
git push origin main

echo ""
echo "✅ Push concluído!"
echo "🌐 Deploy automático em andamento no Cloudflare Pages..."
echo "🔗 https://hub-caicara-gall.pages.dev (disponível em ~30s)"
echo ""
