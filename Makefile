#/ -------------------------------------------------------------------------- //

DOCKER             = sudo -E docker
COMPOSE            = $(DOCKER) compose -f srcs/docker-compose.yml

WORDPRESS_DATA_DIR = $$HOME/data/wordpress/
MARIADB_DATA_DIR   = $$HOME/data/mariadb/
TOOLS_DIR          = srcs/requirements/tools/

INIT_MARKER        = .inception_init
BUILD_MARKER       = .inception_images_built
CREATED_MARKER     = .inception_container_created

.PHONY: all create build down clean fclean reclean re logs sh

all: init create
	$(COMPOSE) start
	$(MAKE) logs

init: $(INIT_MARKER)

$(INIT_MARKER):
	cd $(TOOLS_DIR) && ./inception_init.sh
	touch $(INIT_MARKER)

create: build
	$(COMPOSE) create

build:
	$(COMPOSE) build

down:
	$(COMPOSE) down || true

clean: down
	$(DOCKER) rmi $(shell $(DOCKER) images -qa) || true
	rm $(CREATED_MARKER) || true
	rm $(BUILD_MARKER) || true
	sudo rm -rf $(WORDPRESS_DATA_DIR)* $(MARIADB_DATA_DIR)* || true

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
	$(COMPOSE) convert --services
	@read -p "Enter service name: " service; \
	$(COMPOSE) exec $$service /bin/bash

#/ -------------------------------------------------------------------------- //
