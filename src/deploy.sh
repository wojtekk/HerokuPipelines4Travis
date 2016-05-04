#!/usr/bin/env bash

app=$1

# Add Heroku app as remote

git remote add heroku https://git.heroku.com/$app.git

# Deploy

git push heroku $TRAVIS_BRANCH:master
