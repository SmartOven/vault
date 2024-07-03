#!/bin/bash

mkdir data
export VAULT_ADDR='http://127.0.0.1:8200'
yes | cp -rf vault.hcl /etc/vault.d/vault.hcl
sudo systemctl enable vault.service
sudo systemctl start vault.service
yes | cp -rf vault.panteleevya.ru /etc/nginx/sites-available/vault.panteleevya.ru
sudo ln -s /etc/nginx/sites-available/vault.panteleevya.ru /etc/nginx/sites-enabled/
service nginx reload
