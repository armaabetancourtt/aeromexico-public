#!/usr/bin/env bash
set -euo pipefail

echo "[AEROOPS] Public API logs"
docker compose logs --tail=50 backend
