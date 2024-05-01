#/ -------------------------------------------------------------------------- //

DOCKER             = sudo -E docker
COMPOSE            = $(DOCKER) compose -f srcs/docker-compose.yml
WORDPRESS_DATA_DIR = $$HOME/data/wordpress
MARIADB_DATA_DIR   = $$HOME/data/mariadb
TOOLS_DIR          = srcs/requirements/tools/
INIT_MARKER        = .inception_init
BUILD_MARKER       = .inception_images_built
CREATED_MARKER     = .inception_container_created

.PHONY: all create build down clean fclean re reclean logs sh

all: init create
	$(COMPOSE) start
	$(MAKE) logs

init: $(INIT_MARKER)

$(INIT_MARKER):
	cd $(TOOLS_DIR) && ./inception_init.sh
	touch $(INIT_MARKER)

create: build
	$(COMPOSE) create
	touch $(CREATED_MARKER)

build:
	$(COMPOSE) build
	touch $(BUILD_MARKER)

down:
	$(COMPOSE) down || true

clean: down
	$(DOCKER) rmi $(shell $(DOCKER) images -qa) || true
	rm $(CREATED_MARKER) || true
	rm $(BUILD_MARKER) || true
	sudo rm -rf $$HOME/data/wordpress/* $$HOME/data/mariadb/* || true

fclean: clean
	rm .logs || true
	rm secrets/.secrets_* || true
	rm srcs/.env || true
	rm $(INIT_MARKER) || true

reclean: fclean
	$(MAKE)

re: clean
	$(MAKE) all

logs:
	$(COMPOSE) logs > .logs

sh:
	@cat srcs/docker-compose.yml | grep '#' | grep service
	@read -p "Enter service name: " service; \
	$(COMPOSE) exec $$service /bin/bash

#/ -------------------------------------------------------------------------- //
