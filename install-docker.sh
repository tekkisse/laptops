

apt update && sudo apt upgrade -y

apt install apt-transport-https ca-certificates git curl software-properties-common gnupg2 -y

curl -fsSL https://download.docker.com/linux/debian/gpg |  gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" |  tee /etc/apt/sources.list.d/docker.list

apt update
apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

systemctl enable docker
systemctl start docker


