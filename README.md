# caddy-proxy
Automated [caddy](https://github.com/mholt/caddy) proxy for Docker containers using docker-gen.

### Usage

To run it:

    $ docker run -v /var/run/docker.sock:/tmp/docker.sock:ro -v /data/.caddy:/root/.caddy --name caddy-proxy -p 80:80 -p 443:443 -d blackglory/caddy-proxy --email youremail@mail.com


Then start any containers you want proxied with an env var `VIRTUAL_HOST=subdomain.youdomain.com` just like [nginx-proxy](https://github.com/jwilder/nginx-proxy):

    $ docker run -e VIRTUAL_HOST=foo.bar.com  ...
