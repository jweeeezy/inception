#/ -------------------------------------------------------------------------- //

CONTAINER_NAMES = inception-nginx-1 \
				  inception-mariadb-1 \
				  #inception-wordpress-1

all: up
	$(MAKE) log > .dockerlogs 2>&1
up:
	sudo docker compose up -d
down:
	sudo docker compose down
build:
	sudo docker compose up --build -d
re: fclean build
	$(MAKE) all
log:
	@for container in $(CONTAINER_NAMES); do \
		printf "\e[33m%s\e[0m\n" "$$container"; \
		sudo docker logs $$container && echo; \
		done
fclean: down
	sudo docker rmi $$(sudo docker images -qa)

.PHONY: all up down build re log fclean

#/ -------------------------------------------------------------------------- //
