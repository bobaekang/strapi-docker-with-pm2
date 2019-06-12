# [Strapi containerized](https://github.com/strapi/strapi-docker) with [PM2](http://pm2.keymetrics.io/)

A quick test on dockerized Strapi app, with [PM2](http://pm2.keymetrics.io) for managing environment-specific Strapi servers and using [a custom Docker image for Strapi Beta (`bobaekang/strapi:beta`)](https://hub.docker.com/r/bobaekang/strapi) as a base image.

> ### NOTE
>
> This repo is for experimentation. Do not use it for any serious applications.

## Quickstart

1. Clone this repo

```sh
git clone https://github.com/bobaekang/strapi-docker-with-pm2.git
cd strapi-docker-with-pm2
```

2. Bring up the docker-compose (Add `-d` flag is for [detached mode](https://docs.docker.com/v17.09/compose/reference/up/)) This will build the `bobaekang/strapi:pm2` image as well.

```sh
docker-compose up
```

> Feel free to change the image name.

3. Open `localhost:1337` in a browser and see if the app (development server) is running. (It might take some time.)

4. Go to `localhost:1337/admin` and create the root admin account.

5. Go to "Configurations > Server" and assign port 1338 to production server.

6. Run `strapi-start-production.sh` in the container to start the production server.

```sh
# add "winpty" before the command for Windows
docker exec -it strapi-docker-with-pm2_api_1 ./strapi-start-production.sh
```

That's it!:raised_hands: Now you have your Strapi app--both development and production servers--running in container with PM2.

To apply changes to production server, simply run `pm2 restart production` in the container.

Feel free to fork this repo and edit files/scripts to further customize/improve it.
