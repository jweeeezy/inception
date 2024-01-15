# Notes

## Makefile<->Docker compose<->Dockerfile

### Docker compose

#### [LOG]
- watched yt-video about docker compose v2
    - https://www.youtube.com/watch?v=2MJn2yfa6A8&t=1235s

#### [GENERAL]
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

- Advise: No container names (name them via compose or env variables)
- also dont specify ports for the same reason (have to find out how to do it else)
- for local development you should use docker compose only (intented for workflow)

- run all containers in detached (background) mode and stop them

    ` docker compose up -d `

    ` docker compose down `

#### [COMPOSE v2 NEW FEATURES]

- Service Profiles can built containers separately for debugging

    ` profiles: ["name_of_profile"] `

    ` docker compose ls `

    ` docker compose cp `

    ` docker compose convert `

#### [DOCKER CONTAINER & IMAGE HANDLING]
- first an image (via Dockerfile) is created 

    `docker build -t <name_of_image>`

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

#### [NGINX]
- EXPOSE *PORT_NUMBER* for documentation in Dockerfile

- locations for config files on debian
    - /etc/nginx/nginx.conf
    - /etc/nginx/conf.d
    - /etc/nginx/sites_available/
    - /etc/nginx/sites_enabled/

- have to setup TLS which is a way to guarantee a secure connection between
- two applications (mb OPEN SSL)
