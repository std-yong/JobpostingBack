#!/bin/bash

echo create-react-app
docker-compose run --rm web-front sh -c "echo y | npx create-react-app ."
sleep 5s
echo yarn install
docker-compose run --rm web-front sh -c "yarn set version berry && rm -rf node_modules && yarn install"
sleep 5s
echo add next
docker-compose run --rm web-front sh -c "yarn add next axios"
sleep 5s
echo add vscode
docker-compose run --rm web-front sh -c "yarn dlx @yarnpkg/sdks vscode"
cat source/frontend.webfront.package.json > frontend/web-front/package.json
mkdir frontend/web-front/pages
cat source/frontend.webfront.pages.index.js > frontend/web-front/pages/index.js
