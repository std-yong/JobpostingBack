#!/bin/bash

cat source/backend.web.env > backend/web/.env
cat source/backend.web.Dockerfile > backend/web/Dockerfile
cat source/backend.web.requirements.txt > backend/web/requirements.txt
cat source/backend.web.create_superuser.py > backend/web/create_superuser.py  #add to
cat source/backend.nginx.Dockerfile > backend/nginx/Dockerfile.dev
cat source/backend.nginx.default.conf > backend/nginx/default.dev.conf
cat source/mariadb.master.env > mariadb/master/.env  #changed
cat source/mariadb.slave.env > mariadb/slave/.env    #changed
cat source/mariadb.master.my.cnf > mariadb/master/config/my.cnf           #changed
cat source/mariadb.slave.my.cnf > mariadb/slave/config/my.cnf           #changed
cat source/mariadb.master.sql.init.sql > mariadb/master/sql/init.sql    #changed
cat source/mariadb.slave.sql.init.sql > mariadb/slave/sql/init.sql  #changed
cat source/frontend.nginx.default.dev.conf > frontend/nginx/default.dev.conf
cat source/frontend.nginx.Dockerfile.dev > frontend/nginx/Dockerfile.dev
cat source/frontend.nginx.wait.sh > frontend/nginx/wait.sh
