#!/bin/bash
docker-gen /app/caddy.tmpl /etc/Caddyfile
caddy --conf /etc/Caddyfile --email $EMAIL
