#!/bin/sh
set -e

until curl -s http://vault:8200/v1/sys/health >/dev/null; do
  echo "Waiting for Vault..."
  sleep 2
done

echo "Vault is up. Bootstrapping audit device..."

curl -s \
  --header "X-Vault-Token: root" \
  --request PUT \
  --data '{"type": "file", "options": {"file_path": "/vault/logs/audit.log"}}' \
  http://vault:8200/v1/sys/audit/file || echo "Audit device may already be enabled"

echo "Audit setup complete."
