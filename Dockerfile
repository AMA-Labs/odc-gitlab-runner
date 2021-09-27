FROM ubuntu:20.04

RUN apt-get update && apt-get install make curl -y && \
    rm -rf /var/lib/apt/lists/*

# Install Docker.
RUN apt update && apt install apt-transport-https ca-certificates curl software-properties-common -y
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
RUN apt-cache policy docker-ce
RUN apt install docker-ce -y
RUN usermod -aG docker $(id -un)
# Install Docker-Compose.
RUN curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-Linux-x86_64" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# RUN apt-get update && apt install -y docker.io
# RUN curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-Linux-x86_64" -o /usr/local/bin/docker-compose
# RUN chmod +x /usr/local/bin/docker-compose
# RUN systemctl start docker
# RUN systemctl enable docker
# The following steps are for enabling use 
# of the `docker` command for the current user
# without using `sudo`
# RUN group docker || sudo groupadd docker
# RUN usermod -aG docker ${USER}
