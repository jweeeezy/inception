#/ -------------------------------------------------------------------------- //

CONTAINER_NAMES = inception-nginx-1 \
				  inception-mariadb-1 \
				  #inception-wordpress-1

# command extension for using sudo with the current environment (variables)
# COMPOSE_PROFILES="" -- is needed!
# @note might change to default when testing is done
DOCKER = sudo -E docker

# command extension to use specific .yml file
COMPOSE = $(DOCKER) compose -f srcs/docker-compose.yml

all: build up
	$(MAKE) log > .dockerlogs 2>&1
up:
	$(COMPOSE) up -d
down:
	$(COMPOSE) down
build:
	$(COMPOSE) build
re: fclean
	$(MAKE) all
log:
	@for container in $(CONTAINER_NAMES); do \
		printf "\e[33m%s\e[0m\n" "$$container"; \
		$(DOCKER) logs $$container && echo; \
		done
fclean: down
	$(DOCKER) rmi $(shell $(DOCKER) images -qa)

.PHONY: all up down build re log fclean

#/ -------------------------------------------------------------------------- //
