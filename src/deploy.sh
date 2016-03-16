#!/usr/bin/env bash

app=$1

# Add Heroku app as remote
heroku git:remote --app $app

# Deploy
git push heroku $TRAVIS_BRANCH:master
