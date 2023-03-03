FROM jenkins/jenkins

USER root

RUN apt-get update && \
    apt-get install -y ansible && \
    apt-get install -y iputils-ping

# Install Docker 

RUN apt-get update && \
	apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
mkdir -m 0755 -p /etc/apt/keyrings && \
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
apt-get update && \
apt-get -y install docker-ce

# Compose

RUN curl -L https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker jenkins

USER jenkins
