# Notes

- COMPOSE_PROFILES="default" should be set

## Makefile<->Docker compose<->Dockerfile

#### [LOG]
- watched yt-video about docker compose v2
    - https://www.youtube.com/watch?v=2MJn2yfa6A8&t=1235s
- watched video about docker and docker compose workflow
    - https://www.youtube.com/watch?v=3c-iBn73dDE&t=3041s
- watched yt video about nginx and certificates
    - https://www.youtube.com/watch?v=xNk8fZCuCMU&t=312s

#### [DOCKER COMPOSE]
- Docker compose migrated to Compose V2
(version 3. and older are called Compose V1)
- there is a difference between docker-compose(old) and docker compose (new)
- apparently no version statement is needed anymore (as of compose v2)

    ` docker compose version `

- on school MacOS v2.2.3 is running (as of 01/12/24)

    ` apt-cache policy service `

- to check which versions are officially listed in packet manager

- to explicitly make a container module dependant on another

    ` depends_on: `

- to setup ENV variables

    ` environment: `

    ` - SOME_ENV_VAR=SOME_ENV_VAR_VALUE `

- Advise: No container names (name them via compose or env variables)
- also dont specify ports for the same reason (have to find out how to do it else)
- for local development you should use docker compose only (intented for workflow)

- way of syncing changes of files without needing to rebuild the image everytime

    ` docker compose watch `

- builds container images

    ` docker compose build `

- creates container of image

    ` docker compose create `

- starts containers

    ` docker compose start `

- creates and starts containers (-d = detached from process, --build = /w build)

    ` docker compose up -d `

    ` docker compose up --build `

- stops containers

    ` docker compose stop `

- stops and deletes containers

    ` docker compose down `

- Service Profiles can built containers separately for debugging

    ` profiles: ["name_of_profile"] `

    ` docker compose ls `

    ` docker compose cp `

    ` docker compose convert `

#### [DOCKERFILE]
- apt-get instead of apt?
- DEBIAN_FRONTEND=noninteractive (so user doesnt get prompted)

#### [DOCKER CONTAINER & IMAGE HANDLING]
- first an image (via Dockerfile) is created 

    ` docker build -t <name_of_image> `

- with an image you can create a container and name it

    ` docker run --name <name_of_container> <name_of_image> `

- you can access/attach to a container shell by

    ` docker exec <name_of_container> /bin/bash `

- you can stop a (continously) running container by

    ` docker stop <name_of_container> `

- you can remove a container or image by

    ` docker rm <name_of_container> `

    ` docker rmi <name_of_image> `

- you can see all containers or images by

    ` docker ps -a `

    ` docker images `

- you can get all ids of containers or images by (useful for scripting)

    ` docker ps -qa `

    ` docker images -qa `

- you can show all logs of detached containers by

    ` docker logs <name_of_container> `

#### [DOCKER NETWORK]

- **compose automatically creates a network between the containers!**

- you can create a network by

    ` docker network create <name_of_network> `

- you can see running networks by

    ` docker network ls `

- you can add a container to a network by using the docker run cli

>   docker run -d \  
>   -p *PORT_NUMBER*:*PORT_NUMBER* \  
>   -e ENV_VAR=something \  
>   --net <name_of_network> \  
>   --name <name_of_container> \  
>   <name_of_image>

#### [LEMP Stack]
- guide for LEMP stack with wordpress: (not read)
https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lemp-on-ubuntu-20-04

#### [NGINX]
- EXPOSE *PORT_NUMBER* for documentation in Dockerfile

- locations for config files on debian
    - /etc/nginx/nginx.conf
    - /etc/nginx/conf.d/
    - /etc/nginx/sites_available/
    - /etc/nginx/sites_enabled/

> location of own config file: /etc/nginx/cond.d/**custom-nginx.conf**

- have to setup TLS which is a way to guarantee a secure connection between
- two applications (mb OPEN SSL)
- nginx needs to know where certificates are (in config file)
- e.g.: /etc/nginx/ssl/

- guide for generating ssl cert/key for nginx:
https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-18-04

#### [TSL/SSL Certification]
- with the package of openssl you can generate keys, certificates
- create a key for the host (password protected)

    ` openssl genrsa -des3 -out inception.key 2048 `

- create a signing request

    ` openssl req -new -key inception.key -out inception.csr `

- remove password protection

    ` openssl rsa -in inceptionhost.key.pw -out inceptionhost.key `

- sign our certificate

    ` openssl x509 -req -in inceptionhost.csr -signkey inceptionhost.key -out inceptionhost.crt `

#### [MARIADB]
- all commands are UPPERCASE and are follwed by a ';'

    ` SHOW DATABASES `

    ` USE <database_name> `

    ` SHOW TABLES `

    ` CREATE TABLE <table_name> ( <content_name> TYPE ); `

    ` INSERT INTO your_table_name (column1, column2, column3)
    VALUES (value1, value2, value3); `

