# caddy-proxy
Automated [caddy](https://github.com/mholt/caddy) proxy for Docker containers using docker-gen.

### Usage

Start any containers you want proxied with an env var `VIRTUAL_HOST=subdomain.youdomain.com` just like [nginx-proxy](https://github.com/jwilder/nginx-proxy):

    $ docker run -e VIRTUAL_HOST=foo.bar.com  ...

Then to run it:

    $ docker run -v /var/run/docker.sock:/tmp/docker.sock:ro -v /data/.caddy:/root/.caddy --name caddy-proxy -p 80:80 -p 443:443 -d blackglory/caddy-proxy --email youremail@mail.com

**NOTE: caddy-proxy can not respond to the newly created container, so you need to restart caddy-proxy after new container running.**
