### Update instructions:
### 1. Update the host in the variable config file
### 2. Update host variable in python
### 3. Run this script to get the new cred def
### 4. Update host variable and cred def in shared.js

import requests as rq
from requests.structures import CaseInsensitiveDict

host = "http://192.168.74.198"
schema = "GxgDCXeCGmqqz259Mva9h6:2:address_schema:1.0"

headers = CaseInsensitiveDict()
headers["Content-Type"] = "application/json"
headers["accept"] = "application/json"

tag = host.replace("http://", "").replace(".", "_")

data = """
{
  "revocation_registry_size": 1000,
  "schema_id": "%s",
  "support_revocation": true,
  "tag": "DynAddress%s"
}
""" % (schema, tag)

req1 = rq.post(f'{host}:9020/credential-definitions?create_transaction_for_endorser=false', headers=headers, data=data)
print(req1.content)
cred_def = req1.json()['credential_definition_id']
print("New credential definition:", cred_def)