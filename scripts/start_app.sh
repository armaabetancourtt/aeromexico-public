#!/usr/bin/env bash
set -euo pipefail

echo "[AEROOPS] Starting public reservation tier..."

if [ ! -f .env ]; then
  echo "Missing .env. Copy .env.example to .env and set MONGO_URI first."
  exit 1
fi

docker compose up -d --build

echo
echo "Public services:"
docker compose ps
echo
echo "Frontend: http://localhost:${PUBLIC_PORT:-8080}"
