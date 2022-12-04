#!/usr/bin/env sh

curl -X 'POST' \
  'http://localhost:9020/credential-definitions?create_transaction_for_endorser=false' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "revocation_registry_size": 1000,
  "schema_id": "GxgDCXeCGmqqz259Mva9h6:2:my_schemav1.0:1.0",
  "support_revocation": false,
  "tag": "Github"
}'
