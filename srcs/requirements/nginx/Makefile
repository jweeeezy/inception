#/ ========================================================================== //

# General
.PHONY: 	all daemon stop build run

all: 		daemon build run
daemon:
				docker info || (open -a Docker && sleep 20)
stop:
				docker stop c_nginx
build:
				docker build . -t i_nginx
run:
				docker run -d -p 80:80 --name c_nginx i_nginx
re:
				$(MAKE) stop ; $(MAKE) rm ; $(MAKE) build

# Clean up
.PHONY:		clean fclean rm rm_ps rm_images

clean: 		rm_container
fclean:		rm_all_container rm_all_images
rm:			rm_ps rm_image
rm_all_container:
				docker rm $(docker ps -qa)
rm_container:
				docker rm c_nginx
rm_image:
				docker rmi i_nginx
rm_all_images:
				docker rmi $(docker images -q)

#/ -------------------------------------------------------------------------- //
