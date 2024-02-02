# penultimate latest version as of 01/14/2024
FROM debian:11

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install nginx -y

COPY custom-nginx.conf /etc/nginx/conf.d/

# @note delete before submit
# RUN apt-get update -y && apt-get install tree -y
# RUN apt-get update -y && apt-get install vim -y

# @note not sure if needed
#EXPOSE 443

# starts nginx as a foreground process without the daemon so it keeps running
CMD ["nginx", "-g", "daemon off;"]

