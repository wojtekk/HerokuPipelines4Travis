#!/usr/bin/env bash

app=$1

# Add Heroku app as remote

git remote add heroku https://git:$HEROKU_API_KEY@git.heroku.com/$app.git -f

# Deploy

git push heroku $TRAVIS_BRANCH:master
