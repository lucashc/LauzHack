#!/usr/bin/env sh

# DIDs and their Verkey can be registered on https://selfserve.sovrin.org/ alternatively

if [ $# -ne 2 ]; then
    echo "missing arguments"
    echo "$0 did verkey"
    exit 1
fi

DATA=$(printf '{"network":"buildernet","did":"%s","verkey":"%s","paymentaddr":""}' "$1" "$2")

curl 'https://selfserve.sovrin.org/nym' \
  -H 'accept: */*' \
  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
  --data-raw "$DATA" \
  --compressed

