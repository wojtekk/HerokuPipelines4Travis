# Heroku Pipelines for Travis CI

## Initial setup

Create application and configure pipeline on [Heroku](https://devcenter.heroku.com/articles/pipelines).

To initiate project follow commands:

```bash
npm install herokupipelines4travis lodash --save-dev
$(npm bin)/hp4t setup
```

_Package _lodash_ is optional - install it if you want to use it in `infrastructure/`._

You can edit files:

* `.travis.yml` - Travis CI configuration file
* `infrastructure/` - directory with infrastructure configuration
  * `base.js` - base configuration
  * `stage.js` - stage environment configuration
  * `production.js` - production environment configuration

## Convention

For simplify usage you should define:

```bash
alias hp4t="$(npm bin)/hp4t"
```

## Setup commands

* `hp4t setup` - initialise project
* `hp4t export app_name [heroku_api_key]` - export existing Heroku application configration

## Commands for Travis CI

* `hp4t init` - initialise runtime environment
* `hp4t provision environment_name` - provision Heroku app
* `hp4t pipeline` - set Heroku pipeline
* `hp4t deploy app_name` - deploy code to Heroku app
* `hp4t run app_name "command with params"` - run command on Heroku application (useful for database migration)
* `hp4t promote app_name` - promote existing application to next environment
* `hp4t package output-file.tgz` - build a tarball (tgz) with dependencies for Npm based projects
* `hp4t deploy-tarball app_name file.tgz` - deploy tarball file to a Heorku aplication

## Read more

* [Heroku Pipelines](https://devcenter.heroku.com/articles/pipelines)
* [Travis CI](https://travis-ci.org/)
* [Heroin-JS](https://www.npmjs.com/package/heroin-js)


## Example Travis configuration file

`.travis.yml`

```yaml
---
language: node_js
node_js: stable
env:
  global:
  # ========== Heroku Pipelines for Travis =========
  # HEROKU_API_KEY
  - secure: "..."
  - HP4T_HEROKU_APPNAME_STAGE=hp4t-test-stage
  - HP4T_HEROKU_APPNAME_PRODUCTION=hp4t-test
cache:
  directories:
  - node_modules
install:
- npm install
script:
- npm test
- npm lint
deploy:
  - provider: script
    skip_cleanup: true
    script: make deploy
    on:
      branch: master
after_success:
- hp4t notify-rollbar
```

`Makefile`

```makefile
deploy:
  hp4t init
  hp4t package build.tgz
  hp4t provision stage
  hp4t deploy-tarball build.tgz ${HP4T_HEROKU_APPNAME_STAGE}
  hp4t run ${HP4T_HEROKU_APPNAME_STAGE} "npm run migrate-database"
  hp4t provision production
  hp4t promote ${HP4T_HEROKU_APPNAME_STAGE}
  hp4t run ${HP4T_HEROKU_APPNAME_PRODUCTION} "npm run migrate-database"
```

_Please remember to use one tab indent in `Makefile`._
