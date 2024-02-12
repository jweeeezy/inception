# penultimate latest version as of 01/14/2024
FROM debian:11

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install nginx -y

RUN mkdir ssl

COPY custom-nginx.conf /etc/nginx/conf.d/

#EXPOSE 443

# starts nginx as a foreground process without the daemon so it keeps running
CMD ["nginx", "-g", "daemon off;"]

