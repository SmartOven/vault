#!/bin/bash

UNSEAL_KEYS_FILE="/etc/vault/unseal-keys"
export VAULT_ADDR="http://127.0.0.1:8200"

if [ ! -f "$UNSEAL_KEYS_FILE" ]; then
    echo "Unseal keys file not found!"
    exit 1
fi

source "$UNSEAL_KEYS_FILE"

vault operator unseal $UNSEAL_KEY_1
vault operator unseal $UNSEAL_KEY_2
vault operator unseal $UNSEAL_KEY_3
