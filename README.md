# Ember Fastboot App with Fastboot App Server and Nginx

## Prerequisites

You will need the following things properly installed on your computer.

* [Docker Engine](https://docs.docker.com/engine/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Google Chrome](https://google.com/chrome/)

## Building / Running

* `git clone <repository-url>`
* `cd ember-fastboot-nginx-docker/`
* `docker-compose up` or `docker-compose up -d` to run in detached mode
* Visit localhost on port 8090 which is proxied by nginx to 4201 (fastboot app server)
  * (For the sake of the example, nginx port 80 is mapped to 8090)

## Further Reading / Useful Links

* [ember.js](https://emberjs.com/)
* [ember-cli](https://ember-cli.com/)
* [ember-fastboot](https://ember-fastboot.com/docs/user-guide)
* [fastboot-app-server](https://github.com/ember-fastboot/fastboot-app-server)
* [NGINX Reverse Proxy](https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/)
* [docker-compose](https://docs.docker.com/compose/)
