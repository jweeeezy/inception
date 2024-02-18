#/ -------------------------------------------------------------------------- //

CONTAINER_NAMES = inception_nginx \
                  inception_mariadb \
				  #inception-wordpress-1

# using sudo with env variables
SUDO = sudo -E
# using docker with sudo
DOCKER = $(SUDO) docker
# using COMPOSE_PROFILES=default ifndef
PROFILES := COMPOSE_PROFILES=$(shell if [ -z "$$DOCKER_PROFILES" ]; then echo "default"; else echo "$$DOCKER_PROFILES"; fi)
# using compose with specific .yml file
COMPOSE = $(SUDO) $(PROFILES) docker compose -f srcs/docker-compose.yml

# default command (starts and logs services)
.PHONY: all
all: start
	$(MAKE) log > .dockerlogs 2>&1 ; cat .dockerlogs

# debug commands (logging and attaching with bash)
.PHONY: log sh
log:
	@for container in $(CONTAINER_NAMES); do \
		printf "\e[33m%s\e[0m\n" "$$container"; \
		$(DOCKER) logs $$container && echo; \
		done
sh:
	@cat srcs/docker-compose.yml | grep '#' | grep service
	@read -p "Enter service name: " service; \
	$(COMPOSE) exec $$service /bin/bash

# main compose handling commands
.PHONY: start create build stop
start: create
	$(COMPOSE) start
create:
	$(COMPOSE) create
build:
	$(COMPOSE) build
stop:
	$(COMPOSE) stop

# cleaning commands and rebuild (re) command
.PHONY: stop down clean fclean re
down:
	$(COMPOSE) down
clean: down
fclean: down
	$(DOCKER) rmi $(shell $(DOCKER) images -qa) || echo "fclean: no images to clean!"
re: fclean build
	$(MAKE) all

#/ -------------------------------------------------------------------------- //
