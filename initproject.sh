#!/bin/sh
echo "Creating necessary folders"
mkdir ./static
mkdir ./static/images
mkdir ./static/css
mkdir ./static/js
mkdir ./views
mkdir ./models
mkdir ./test

echo "Copying Markup and CSS BoilerPlate..."
cp ./templates/app/server.coffee ./server.coffee
cp ./templates/app/package.json ./package.json
cp ./templates/app/.gitignore ./.gitignore
cp ./templates/app/config.json ./config.json
cp ./templates/app/Makefile ./Makefile
cp ./templates/test/stub.coffee ./test/stub.coffee
curl http://twitter.github.com/bootstrap/assets/bootstrap.zip > ./static/bootstrap.zip
cp ./templates/views/500.jade ./views/500.jade
cp ./templates/views/404.jade ./views/404.jade
cp ./templates/views/index.jade ./views/index.jade
cp ./templates/views/layout.jade ./views/layout.jade
cp ./templates/js/script.coffee ./static/js/script.coffee
# TODO copy over the models

echo "Setting up the dependencies from NPM..."
npm install

echo "Removing the stuff you dont want..."
rm -rf .git
rm -rf templates
rm README.md
rm -rf initproject.sh

echo "Initing the new git project..."
git init
git add .
git commit -m"Initial Commit"
