#!/bin/bash

docker-compose run --rm web sh -c "python manage.py makemigrations"
sleep 5s
docker-compose run --rm web sh -c "python manage.py migrate"

echo "Migration Successful!!!"
