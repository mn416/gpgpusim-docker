# Docker variables
USER=$(if $(shell id -u),$(shell id -u),9001)
GROUP=$(if $(shell id -g),$(shell id -g),1000)

# Build the docker image
.PHONY: build-docker
build-docker: build-docker-1804

# Enter the docker image
.PHONY: shell
shell: shell-1804

# Build the docker image (Ubuntu 18.04)
.PHONY: build-docker-1804
build-docker-1804:
	 (docker build -f Dockerfile-1804 --build-arg UID=$(USER) --build-arg GID=$(GROUP) . --tag gpgpusim-ubuntu1804)

# Enter the docker image (Ubuntu 18.04)
.PHONY: shell-1804
shell-1804: build-docker-1804
	docker run -it --shm-size 256m --hostname gpgpusim-ubuntu1804 -u $(USER) -v /home/$(shell whoami)/.ssh:/home/dev-user/.ssh  -v $(shell pwd):/workspace gpgpusim-ubuntu1804:latest /bin/bash

# Build the docker image (Ubuntu 12.04)
.PHONY: build-docker-1204
build-docker-1204:
	 (docker build -f Dockerfile-1204 --build-arg UID=$(USER) --build-arg GID=$(GROUP) . --tag gpgpusim-ubuntu1204)

# Enter the docker image (Ubuntu 12.04)
.PHONY: shell-1204
shell-1204: build-docker-1204
	docker run -it --shm-size 256m --hostname gpgpusim-ubuntu1204 -u $(USER) -v /home/$(shell whoami)/.ssh:/home/dev-user/.ssh  -v $(shell pwd):/workspace gpgpusim-ubuntu1204:latest /bin/bash
