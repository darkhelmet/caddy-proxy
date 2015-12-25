FROM ubuntu
MAINTAINER BlackGlory <woshenmedoubuzhidao@blackglory.me>

RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    ca-certificates \
    curl \
    wget \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

RUN mkdir -p /tmp/caddy \
 && curl -sL -o /tmp/caddy/caddy_linux_amd64.tar.gz "https://caddyserver.com/download/build?os=linux&arch=amd64" \
 && tar -xf /tmp/caddy/caddy_linux_amd64.tar.gz -C /tmp/caddy \
 && mv /tmp/caddy/caddy /usr/bin/ \
 && chmod +x /usr/bin/caddy \
 && rm -rf /tmp/caddy

ENV DOCKER_GEN_VERSION 0.4.3

RUN wget https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && rm /docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz

RUN printf ":80\nproxy / caddyserver.com" > /etc/Caddyfile

COPY . /app/
WORKDIR /app/

ENV DOCKER_HOST unix:///tmp/docker.sock

RUN chmod +x /app/docker-entrypoint.sh

ENTRYPOINT ["/app/docker-entrypoint.sh", "caddy", "--conf", "/etc/Caddyfile"]
