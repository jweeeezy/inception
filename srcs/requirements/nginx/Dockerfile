# penultimate latest version as of 01/14/2024
FROM debian:11

RUN apt-get update -y && apt-get install -y
RUN apt-get upgrade -y

RUN apt-get install nginx -y
CMD ["nginx", "-g", "daemon off;"]
# @note now how does a container just run and i can hop onto it ?

#RUN apt-get install systemctl -y
#RUN systemctl start nginx

#COPY ./files /usr/src/files
#WORKDIR /usr/src/files
