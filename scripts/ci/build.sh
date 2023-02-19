#!/bin/bash

cd /home/zlorg/app/scripts/
source load_env_file.sh
cd ..
docker compose stop
docker compose --env-file ./web/web.env build --no-cache
docker compose --env-file ./web/web.env up -d --remove-orphans --force-recreate
docker compose --env-file ./web/web.env exec web python manage.py makemigrations
docker compose --env-file ./web/web.env exec web python manage.py migrate
docker compose --env-file ./web/web.env restart
