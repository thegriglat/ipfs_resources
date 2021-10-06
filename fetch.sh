#!/bin/bash

FETCH_URL="https://raw.githubusercontent.com/thegriglat/ipfs_resources/main/resources.txt"

IPFS=$(which ipfs)

if [ -z "$IPFS" ]; then
    echo "'ipfs' not found, check PATH"
    exit 0
fi

curl -s "$FETCH_URL" | tail -n +2  | while read line; do
    CID=$(echo $line | awk '{print $1}');
    $IPFS pin add $CID
done