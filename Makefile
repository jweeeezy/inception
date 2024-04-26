#/ -------------------------------------------------------------------------- //

DOCKER             = sudo -E docker
COMPOSE            = $(DOCKER) compose -f srcs/docker-compose.yml
WORDPRESS_DATA_DIR = $$HOME/data/wordpress
MARIADB_DATA_DIR   = $$HOME/data/mariadb

.PHONY: all create build volumes down clean fclean re log logs sh

all:    volumes create
	$(COMPOSE) start
	$(MAKE) log > .logs 2>&1

create: build
	$(COMPOSE) create

build:
	$(COMPOSE) build

volumes:
	sudo mkdir -p $(WORDPRESS_DATA_DIR)
	sudo mkdir -p $(MARIADB_DATA_DIR)

down:
	$(COMPOSE) down

fclean: down
	$(DOCKER) rmi $(shell $(DOCKER) images -qa) || echo "fclean: no images to clean!"
	sudo rm -rf $$HOME/data/wordpress $$HOME/data/mariadb

re:     fclean
	$(MAKE) all

logs:
	$(COMPOSE) logs

sh:
	@cat srcs/docker-compose.yml | grep '#' | grep service
	@read -p "Enter service name: " service; \
	$(COMPOSE) exec $$service /bin/bash

#/ -------------------------------------------------------------------------- //
