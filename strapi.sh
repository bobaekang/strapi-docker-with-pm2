#!/bin/sh
set -ea

_stop() {
  echo "Stopping"
  kill -SIGINT "$PID"
  wait "$PID"
}

trap _stop SIGTERM SIGINT

cd /usr/src/api

APP_NAME=${APP_NAME:-strapi-app}
DATABASE_CLIENT=${DATABASE_CLIENT:-mongo}
DATABASE_HOST=${DATABASE_HOST:-localhost}
DATABASE_PORT=${DATABASE_PORT:-27017}
DATABASE_NAME=${DATABASE_NAME:-strapi}
DATABASE_SRV=${DATABASE_SRV:-false}
EXTRA_ARGS=${EXTRA_ARGS:-}
PRODUCTION=${PRODUCTION:-0}

if [ ! -f "$APP_NAME/package.json" ]
then
    strapi new ${APP_NAME} \
      --dbclient=$DATABASE_CLIENT \
      --dbhost=$DATABASE_HOST \
      --dbport=$DATABASE_PORT \
      --dbsrv=$DATABASE_SRV \
      --dbname=$DATABASE_NAME \
      --dbusername=$DATABASE_USERNAME \
      --dbpassword=$DATABASE_PASSWORD \
      --dbssl=$DATABASE_SSL \
      --dbauth=$DATABASE_AUTHENTICATION_DATABASE \
      $EXTRA_ARGS
elif [ ! -d "$APP_NAME/node_modules" ]
then
    npm install --prefix ./$APP_NAME
fi

cd $APP_NAME
pm2 start --name develop npm -- run develop

tail -f /dev/null &
PID=$!

wait "$PID"
