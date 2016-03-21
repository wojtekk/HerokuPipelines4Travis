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