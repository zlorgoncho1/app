#!/bin/bash

cd /home/zlorg/app/scripts/
source load_env_file.sh
cd ..
docker compose --env-file ./web/web.env build --no-cache
docker compose --env-file ./web/web.env push web
docker compose --env-file ./web/web.env push database
kubectl apply -f scripts/cd/deploy.yaml