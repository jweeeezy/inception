#/ -------------------------------------------------------------------------- //

CONTAINER_NAMES = inception-nginx-1 \
				  inception-mariadb-1 \
				  #inception-wordpress-1

all: build
	$(MAKE) log > .dockerlogs 2>&1
build:
	sudo docker compose up -d
stop:
	sudo docker compose down
log:
	@for container in $(CONTAINER_NAMES); do \
		printf "\e[33m%s\e[0m\n" "$$container"; \
		sudo docker logs $$container && echo; \
		done
clean:
	sudo docker rm $(docker ps -qa)
fclean: clean
	sudo docker rmi $(docker images -qa)
.PHONY: all stop clean fclean log

#/ -------------------------------------------------------------------------- //
