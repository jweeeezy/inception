#/ -------------------------------------------------------------------------- //

CONTAINER_NAMES = inception_nginx \
                  inception_mariadb \
				  #inception-wordpress-1

# command extension for using sudo with the current environment (variables)
# COMPOSE_PROFILES="" -- is needed!
# @note might change to default when testing is done
DOCKER = sudo -E docker

# command extension to use specific .yml file
COMPOSE = $(DOCKER) compose -f srcs/docker-compose.yml

# default make command, starts and logs containers
.PHONY: all log
all: start
	$(MAKE) log > .dockerlogs 2>&1
	cat .dockerlogs
log:
	@for container in $(CONTAINER_NAMES); do \
		printf "\e[33m%s\e[0m\n" "$$container"; \
		$(DOCKER) logs $$container && echo; \
		done

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
