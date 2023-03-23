#!/bin/bash

cat source/backend.web.config.urls.py > backend/web/config/urls.py
cat source/backend.web.todo.urls.py > backend/web/todo/urls.py
cat source/backend.web.todo.serializers.py > backend/web/todo/serializers.py
cat source/backend.web.todo.views.py > backend/web/todo/views.py
docker-compose run --rm web sh -c "echo yes | python manage.py collectstatic"
docker-compose up -d --build
