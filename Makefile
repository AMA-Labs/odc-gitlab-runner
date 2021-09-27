TAG=jcrattzama/odc-gitlab-runner

build:
	docker build . -t ${TAG}

push:
	docker push ${TAG}

sudo-ubuntu-install-docker:
	sudo apt-get update
	sudo apt install -y docker.io
	sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-Linux-x86_64" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	sudo systemctl start docker
	sudo systemctl enable docker
	# The following steps are for enabling use 
	# of the `docker` command for the current user
	# without using `sudo`
	getent group docker || sudo groupadd docker
	sudo usermod -aG docker ${USER}
