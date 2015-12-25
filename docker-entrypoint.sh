#!/bin/bash
docker-gen /app/caddy.tmpl /etc/Caddyfile
exec "$@" 
