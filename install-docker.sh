

apt update && sudo apt upgrade -y

apt install apt-transport-https ca-certificates git curl software-properties-common gnupg2 -y

curl -fsSL https://download.docker.com/linux/debian/gpg |  gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian trixie stable" |   sudo tee /etc/apt/sources.list.d/docker.list

sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

DOCKER_VERSION="5:29.1.4-1~debian.13~trixie"
sudo apt install docker-ce=$DOCKER_VERSION docker-ce-cli=$DOCKER_VERSION containerd.io docker-buildx-plugin docker-compose-plugin

systemctl enable docker
systemctl start docker


