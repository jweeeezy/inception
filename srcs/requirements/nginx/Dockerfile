# penultimate latest version as of 01/14/2024
FROM debian:11

RUN apt-get update -y && apt-get install -y
RUN apt-get upgrade -y

RUN apt-get install nginx -y
CMD ["nginx", "-g", "daemon off;"]

