#!/usr/bin/env bash
set -e

projectType=$1

if ! [ "$projectType" == "nodejs" ] && ! [ "$projectType" == "php" ] ; then
 echo "Unknown project type."
 exit 3;
fi

# Initialise infrastructure (HeroinJS)

echo "[HP4T] Infrastructure configration: initialising"
if [ -d $HP4T_PROJECT_DIR/infrastructure ]; then
  echo "[HP4T] Infrastructure configration: exists, moving directory `infrastructure` to `infrastructure.pre_hp4t`."
  mv $HP4T_PROJECT_DIR/infrastructure $HP4T_PROJECT_DIR/infrastructure.pre_hp4t
fi
cp -r $HP4T_TEMPLATES_DIR/infrastructure/$projectType $HP4T_PROJECT_DIR/infrastructure

# Initialise Travis

echo "[HP4T] Travis configuration: initialising"
if [ -f $HP4T_PROJECT_DIR/.travis.yml ]; then
  echo "[HP4T] Travis configuration: exists, moving file `.travis.yml` to  `.travis.yml.pre_hp4t`"
  mv $HP4T_PROJECT_DIR/.travis.yml $HP4T_PROJECT_DIR/.travis.yml.pre_hp4t
fi
cp $HP4T_TEMPLATES_DIR/travis/$projectType/.travis.yml $HP4T_PROJECT_DIR/.travis.yml

# Read and update project configuration

echo;

# Read HP4T_DEPLOY_FROM_REPOSITORY

while read -r -p "Repository name (format: prefix/repository): " IN_DEPLOY_FROM_REPOSITORY; do
  if [ -n "$IN_DEPLOY_FROM_REPOSITORY" ]; then
    break
  else
    echo -e "\e[91mRepository name can not be empty.\e[39m";
  fi;
done;
sed -i "s|__HP4T_DEPLOY_FROM_REPOSITORY__|$IN_DEPLOY_FROM_REPOSITORY|" $HP4T_PROJECT_DIR/.travis.yml;

# Read HP4T_DEPLOY_FROM_BRANCH

read -r -p "Deploy only from branch [master]: " IN_DEPLOY_FROM_BRANCH;
if [ -z "$IN_DEPLOY_FROM_BRANCH" ]; then
  IN_DEPLOY_FROM_BRANCH="master"
fi;
sed -i "s|__HP4T_DEPLOY_FROM_BRANCH__|$IN_DEPLOY_FROM_BRANCH|" $HP4T_PROJECT_DIR/.travis.yml;

# Read HP4T_HEROKU_APPNAME_PRODUCTION

while read -r -p "Heroku production application name: " IN_HEROKU_APPNAME_PRODUCTION; do
  if [ -n "$IN_HEROKU_APPNAME_PRODUCTION" ]; then
    break
  else
    echo -e "\e[91mHeroku production application name can not be empty.\e[39m";
  fi;
done;
sed -i "s|__HP4T_HEROKU_APPNAME_PRODUCTION__|$IN_HEROKU_APPNAME_PRODUCTION|" $HP4T_PROJECT_DIR/.travis.yml;

# Read HP4T_HEROKU_APPNAME_STAGE

read -r -p "Heroku stage application name [$IN_HEROKU_APPNAME_PRODUCTION-stage]: " IN_HEROKU_APPNAME_STAGE;
if [ -z "$IN_HEROKU_APPNAME_PRODUCTION" ]; then
  IN_HEROKU_APPNAME_PRODUCTION="$IN_HEROKU_APPNAME_PRODUCTION-stage"
fi;
sed -i "s|__HP4T_HEROKU_APPNAME_STAGE__|$IN_HEROKU_APPNAME_PRODUCTION|" $HP4T_PROJECT_DIR/.travis.yml;

# Read HP4T_ROLLBAR_DEPLOY_KEY

read -r -p "Rollbar Depploy Key: " IN_ROLLBAR_DEPLOY_KEY;
if [ -z "$IN_ROLLBAR_DEPLOY_KEY" ]; then
  sed -i "s|__HP4T_ROLLBAR_DEPLOY_KEY__|$IN_ROLLBAR_DEPLOY_KEY|" $HP4T_PROJECT_DIR/.travis.yml;
fi;

# Read HEROKU_API_KEY

while read -r -p "Heroku API Key: " IN_HEROKU_API_KEY; do
  if [ -n "$IN_HEROKU_API_KEY" ]; then
    break
  else
    echo -e "\e[91mHeroku API key can not be empty.\e[39m";
  fi;
done;
sed -i "s|__HEROKU_API_KEY__|$IN_HEROKU_API_KEY|" $HP4T_PROJECT_DIR/.travis.yml;
