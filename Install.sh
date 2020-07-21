echo "--------------------Установка Midnight Commander--------------------"
apt install mc -y
echo "--------------------OK--------------------" 

echo "--------------------Установка Docker--------------------"
apt-get remove docker docker-engine docker.io containerd runc
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io -y
docker run hello-world
echo "--------------------OK--------------------" 

echo "--------------------Установка DotNet Core 3.1--------------------"
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get update
apt-get install -y dotnet-sdk-3.1
apt-get install -y aspnetcore-runtime-3.1
echo "--------------------OK--------------------" 

echo "--------------------Установка MySQL--------------------"
apt install mysql-server -y
echo "--------------------OK--------------------" 

echo "--------------------Установка Neo4j--------------------"
wget --no-check-certificate -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
echo 'deb http://debian.neo4j.org/repo stable/' > /etc/apt/sources.list.d/neo4j.list
apt update 
apt install neo4j -y
cp -f neo4j.conf /etc/neo4j
service neo4j restart
iptables -A INPUT -p tcp --dport 7474 -j ACCEPT
iptables -A INPUT -p tcp --dport 7687 -j ACCEPT
echo "--------------------OK--------------------" 

echo "--------------------Установка MongoDB--------------------"
apt-get install gnupg -y
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
apt-get update
apt-get install -y mongodb-org
systemctl start mongod
echo "--------------------OK--------------------" 

echo "--------------------Установка Redis--------------------"
apt install redis-server -y
echo "--------------------OK--------------------" 

echo "--------------------Установка NGinx--------------------"
apt install nginx -y
echo "--------------------OK--------------------"

echo "--------------------Установка Certbot--------------------"
sudo apt-get update
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install python-certbot-nginx -y
echo "--------------------OK--------------------"