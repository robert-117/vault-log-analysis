#!/bin/sh
set -e

export VAULT_ADDR=http://127.0.0.1:8200

export VAULT_ADDR=http://127.0.0.1:8200

echo "Waiting for Vault to become ready..."
until vault status 2>/dev/null | grep -q 'Initialized.*false'; do
  echo "Waiting..."
  sleep 2
done

echo "Initializing Vault..."
vault operator init \
  -key-shares=1 \
  -key-threshold=1 \
  -format=json > /vault/logs/init.json

# Extract unseal key and root token from init.json
UNSEAL_KEY=$(jq -r '.unseal_keys_b64[0]' /vault/logs/init.json)
ROOT_TOKEN=$(jq -r '.root_token' /vault/logs/init.json)

# Save for reuse
echo "$UNSEAL_KEY" > /vault/logs/unseal.key
echo "$ROOT_TOKEN" > /vault/logs/root.token

echo "Unsealing Vault..."
vault operator unseal $UNSEAL_KEY

# Optional: Login and verify
vault login $ROOT_TOKEN
vault status

# Write the telemetry policy
vault policy write vault_telemetry - <<EOF
path "/sys/metrics" {
  capabilities = ["read", "list"]
}
EOF

# Create a token with the policy
TOKEN=$(vault token create -policy=vault_telemetry -ttl=87600h -format=json | jq -r .auth.client_token)

# Save token for Prometheus
echo "$TOKEN" > /shared/prometheus-token.txt
chmod 644 /shared/prometheus-token.txt
