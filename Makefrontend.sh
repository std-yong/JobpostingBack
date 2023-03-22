#!/bin/bash

echo edit docker-compose file
cat source/docker-compose.yml > docker-compose.yml
sleep 1s
echo create-react-app
docker-compose run --rm web-front sh -c "echo y | npx create-react-app ."
sleep 10s
echo yarn install
docker-compose run --rm web-front sh -c "yarn set version berry && rm -rf node_modules && yarn install"
sleep 10s
echo add next
docker-compose run --rm web-front sh -c "yarn add next axios"
sleep 5s
echo add vscode
docker-compose run --rm web-front sh -c "yarn dlx @yarnpkg/sdks vscode"
cat source/frontend.webfront.package.json > frontend/web-front/package.json
