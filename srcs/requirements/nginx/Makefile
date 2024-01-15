#/ ========================================================================== //

# General
.PHONY: 	all daemon stop build run

all: 		daemon build
daemon:
				docker info || (open -a Docker && sleep 20)
stop:
				docker stop --name inc_nginx
build:
				docker build -t inc_nginx .
run:
				docker run --name inc_nginx -d inc_nginx
re:
				$(MAKE) stop ; $(MAKE) rm ; $(MAKE) build

# Clean up
.PHONY:		clean fclean rm rm_ps rm_images

clean: 		rm_ps
fclean:		rm_images
rm:			rm_ps rm_images
rm_ps:
				docker rm inc_nginx
rm_images:
				docker image rm --name inc_nginx

#/ -------------------------------------------------------------------------- //
