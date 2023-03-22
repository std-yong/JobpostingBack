#!/bin/bash

DjangoSettingsFile=./backend/web/config/

Secret_Key=`grep SECRET_KEY ${DjangoSettingsFile}/settings.py`
sed -i "s@SECRET_KEY@${Secret_Key}@g" source/backend.web.config.settings.py
cat source/backend.web.config.settings.py > backend/web/config/settings.py
cat source/todo.models.py > backend/web/todo/models.py
cat source/todo.admin.py > backend/web/todo/admin.py

docker-compose run --rm web sh -c "python manage.py makemigrations"
sleep 10s
docker-compose run --rm web sh -c "python manage.py migrate"
sleep 10s
docker-compose run --rm web sh -c "python create_superuser.py"
