#!/usr/bin/env bash
set -euo pipefail

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="./backups"
LOGS_BACKUP_FILE="${BACKUP_DIR}/public_logs_${TIMESTAMP}.tar.gz"

mkdir -p "$BACKUP_DIR"

echo "[AEROOPS] Archiving public application logs..."
docker compose exec -T backend sh -c "tar czf - -C /app/logs ." > "$LOGS_BACKUP_FILE"
echo "Saved: $LOGS_BACKUP_FILE"

if [ "${1:-}" = "--s3" ] && [ -n "${2:-}" ]; then
  if ! command -v aws >/dev/null 2>&1; then
    echo "AWS CLI is required for S3 upload."
    exit 1
  fi
  aws s3 cp "$LOGS_BACKUP_FILE" "s3://$2/backups/public-logs/"
  echo "Uploaded to s3://$2/backups/public-logs/"
fi

find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -delete

echo "Database backups are intentionally handled by the internal data-plane repository."
