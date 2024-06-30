# Vault setup
How to set up - https://developer.hashicorp.com/vault/tutorials/getting-started/getting-started-deploy
Run once - `echo "export VAULT_ADDR='http://127.0.0.1:8200'" >> ~/.bashrc`
Kill vault process - `pgrep -f vault | xargs kill`
Delete the data - `rm -rf data`
