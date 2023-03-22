#!/bin/bash
mkdir backend
mkdir frontend
mkdir mariadb
mkdir mariadb/master                   #add
mkdir mariadb/slave                    #add
mkdir mariadb/master/volume            #add
mkdir mariadb/master/sql               #add
mkdir mariadb/master/config            #add
mkdir mariadb/slave/volume             #add
mkdir mariadb/slave/sql                #add
mkdir mariadb/slave/config             #add
cd backend
mkdir web
mkdir nginx
cd ..
mkdir backend/web/static
mkdir frontend/nginx
mkdir frontend/web-front
touch backend/web/.env
touch backend/web/Dockerfile
touch backend/web/create_superuser.py    #add to
touch backend/web/requirements.txt
touch backend/nginx/Dockerfile.dev
touch backend/nginx/default.dev.conf
touch frontend/nginx/Dockerfile.dev
touch frontend/nginx/default.dev.conf
touch frontend/nginx/wait.sh
