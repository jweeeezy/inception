# Notes

## Makefile<->Docker compose<->Dockerfile

### Docker compose

#### [LOG] watched yt-video about docker compose v2
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

    ` depends_on `

- Advise: No container names (name them via compose or env variables)
- also dont specify ports for the same reason (have to find out how to do it else)
- for local development you should use docker compose only (intented for workflow)

#### [COMPOSE v2 NEW FEATURES]

- Service Profiles can built containers separately for debugging

    ` profiles: ["name_of_profile"] `

    ` compose ls `

    ` compose cp `

