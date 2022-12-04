import requests as rq
from requests.structures import CaseInsensitiveDict

host = "http://128.179.190.207"
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
  "tag": "RevokableAddress%s"
}
""" % (schema, tag)

req1 = rq.post(f'{host}:9020/credential-definitions?create_transaction_for_endorser=false', headers=headers, data=data)
print(req1.content)
cred_def = req1.json()['credential_definition_id']
print("New credential definition:", cred_def)