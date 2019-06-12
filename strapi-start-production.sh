#!/bin/sh
CMD="NODE_ENV=production pm2 start --name production"
CMD="$CMD npm -- run start --prefix strapi-app"
eval $CMD