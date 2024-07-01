#!/bin/bash

mkdir data
export VAULT_ADDR='http://127.0.0.1:8200'
yes | cp -rf vault.hcl /etc/vault.d/vault.hcl
sudo systemctl enable vault.service
sudo systemctl start vault.service
yes | cp -rf vault_nginx_conf /etc/nginx/sites-enabled/vault_nginx_conf
service nginx reload
