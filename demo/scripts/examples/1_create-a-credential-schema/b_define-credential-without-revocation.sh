#!/usr/bin/env sh

curl -X 'POST' \
  'http://localhost:9020/credential-definitions?create_transaction_for_endorser=false' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "revocation_registry_size": 1000,
  "schema_id": "S5kj1RWsVgEZEy4F4ZLuzZ:2:demo-lauzhack:1.0",
  "support_revocation": false,
  "tag": "LauzhackDemo"
}'
