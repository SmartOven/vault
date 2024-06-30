# Vault setup
## How to set up
1. Install `vault`
   1. `sudo apt update && sudo apt install gpg wget`
   2. `wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg`
   3. `gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint`
   4. `echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list`
   5. `sudo apt update && sudo apt install vault`
2. Export VAULT_ADDR
   1. `echo "export VAULT_ADDR='http://127.0.0.1:8200'" >> ~/.bashrc`
   2. `export VAULT_ADDR='http://127.0.0.1:8200'` or just reload the terminal
3. Start the server and check if it is ok
   1. `bash run.sh`
   2. `systemctl status vault.service` to check if the service is working
   3. Go to the browser and open `http://<server_ip>/ui` to check if the UI is working
4. Init and unseal vault
   1. `vault operator init`. It should display 5 Unseal Keys and 1 Initial Root Token – save them in a safe place.
   2. Open UI in browser and unseal the vault by inserting 3/5 Unseal Keys one by one in the given form
5. Make an auto-unseal tool
   1. `mkdir -p /etc/vault`
   2. `nano /etc/vault/unseal-keys` - put all 5 Unseal Keys like this `UNSEAL_KEY_1=<your-unseal-key-1>` each on its row
   3. `chmod 600 /etc/vault/unseal-keys`
   4. `chown root:root /etc/vault/unseal-keys`
   5. `cp unseal-vault.sh /usr/local/bin/unseal-vault.sh`
   6. `chmod +x /usr/local/bin/unseal-vault.sh`
   7. `cp vault-unseal.service /etc/systemd/system/vault-unseal.service`
   8. `sudo systemctl daemon-reload`
   9. `sudo systemctl enable vault-unseal.service`
   10. `sudo systemctl start vault-unseal.service`
6. Reboot the server and check that vault has started and has been unsealed

Now it is ready to use, to access it just open UI and insert Root Token that you got during the initializing the server
