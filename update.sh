sudo apt-get update
sudo apt-get install curl tar ca-certificates
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker
curl -L -o /usr/local/bin/elytra https://github.com/pyrohost/elytra/releases/latest/download/elytra_linux_amd64 
sudo chmod u+x /usr/local/bin/elytra
useradd -r -m -d /var/lib/pyrodactyl -s /usr/sbin/nologin pyrodactyl
mkdir /etc/elytra
systemctl stop wings
systemctl disable wings
rm /etc/systemd/system/wings.service
sudo mv /var/lib/pterodactyl/*.* /var/lib/pyrodactyl/*.*

sudo systemctl enable elytra
