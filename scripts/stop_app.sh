#!/usr/bin/env bash
set -euo pipefail

echo "[AEROOPS] Stopping public reservation tier..."
docker compose down
