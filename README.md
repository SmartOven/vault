# Vault setup

## Official doc for reference

https://developer.hashicorp.com/vault/tutorials/getting-started/getting-started-deploy

## How to set up

1. Update system with `apt update`
2. Install and set up `ufw`
    - `apt install ufw`
    - `ufw default deny incoming`
    - `ufw default allow outgoing`
    - `ufw allow 22/tcp`
    - `ufw allow 22`
    - `ufw allow 80/tcp`
    - `ufw allow 443`
    - `ufw allow 80,443/tcp`
    - `ufw enable`
    - `ufw status verbose`
    - Don't forget to check if new ssh connections are working
3. Install `docker` with this guide - https://docs.docker.com/engine/install/ubuntu/
4. Install `docker-compose`
    - `sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`
    - `sudo chmod +x /usr/local/bin/docker-compose`
    - `docker-compose --version`

Now it is ready to use, to access it just open UI and insert Root Token that you got during the initializing the server
