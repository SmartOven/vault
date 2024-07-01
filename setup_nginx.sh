#!/bin/bash
yes | cp -rf vault.panteleevya.ru /etc/nginx/sites-available/vault.panteleevya.ru
sudo ln -s /etc/nginx/sites-available/vault.panteleevya.ru /etc/nginx/sites-enabled/
nginx -t
service nginx reload