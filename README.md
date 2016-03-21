# Heroku Pipelines for Travis CI

## Initial setup

Create application and configure pipeline on [Heroku](https://devcenter.heroku.com/articles/pipelines).

To initiate project follow commands:

    npm install herokupipelines4travis --save
    $(npm bin)/hp4t setup

You can edit files:

* `.travis.yml` - Travis CI configuration file
* `infrastructure/` - directory with infrastructure configuration
  * `base.js` - base configuration
  * `stage.js` - stage environment configuration
  * `production.js` - production environment configuration

## Convention

For simplify usage you should define:

    alias hp4t="$(npm bin)/hp4t"

## Important commands

* `hp4t setup` - initialise project
* `hp4t export app_name [heroku_api_key]` - export existing Heroku application configration

## Commands used on Travis CI

* `hp4t init` - initialise runtime environment
* `hp4t provision environment_name` - provision Heroku app
* `hp4t deploy app_name` - deploy code to Heroku app
* `hp4t run app_name "command with params"` - run command on Heroku application (useful for database migration)
* `hp4t promote app_name` - promote existing application to next environment

## Read more

* [Heroku Pipelines](https://devcenter.heroku.com/articles/pipelines)
* [Travis CI](https://travis-ci.org/)
* [Heroin-JS](https://www.npmjs.com/package/heroin-js)