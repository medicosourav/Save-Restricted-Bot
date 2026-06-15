# Deploy On Oracle Cloud Always Free

This guide runs the bot on an Oracle Cloud Always Free Ubuntu VM with Docker.

## 1. Create The VM

1. Create an Oracle Cloud account.
2. Go to **Compute > Instances > Create instance**.
3. Choose an **Always Free Eligible** Ubuntu image.
4. Use an Always Free shape, preferably **VM.Standard.A1.Flex**.
5. Add your SSH public key.
6. Create the instance and copy its public IP address.

Oracle Always Free resources are available for the life of the account, within Oracle's free resource limits.

## 2. Connect To The VM

```bash
ssh ubuntu@YOUR_ORACLE_VM_PUBLIC_IP
```

## 3. Install Docker

```bash
sudo apt update
sudo apt install -y ca-certificates curl git
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker ubuntu
```

Log out and log back in after `usermod`.

## 4. Clone And Configure The Bot

```bash
git clone https://github.com/medicosourav/Save-Restricted-Bot.git
cd Save-Restricted-Bot
cp .env.example .env
nano .env
```

Fill in:

```bash
TOKEN=your_botfather_token
ID=your_numeric_api_id
HASH=your_api_hash
STRING=your_pyrogram_session_string
```

Do not commit `.env`.

## 5. Start The Bot

```bash
docker compose up -d --build
docker compose logs -f
```

When the bot is running, open Telegram and send:

```text
/start
```

## Useful Commands

```bash
docker compose ps
docker compose logs -f
docker compose restart
docker compose down
git pull
docker compose up -d --build
```

Only use this bot for content you own or have permission to access.
