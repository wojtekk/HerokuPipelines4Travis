#!/usr/bin/env bash
set -e

# ==================== Install Heroku Toolbelt ====================

if command -v heroku 2>/dev/null; then
  echo "Heroku Toolbelt Installed"
else
  echo "Install Heroku Toolbelt"
  wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
  heroku plugins:install heroku-pipelines
fi;

# ==================== Setup Heroku ====================

# Heroku git credentials

echo "Setup Heroku git"
netrc_content="machine git.heroku.com\n  login git\n  password $HEROKU_API_KEY"
echo -e $netrc_content >> ~/.netrc

# ==================== Update NodeJS ====================

node_version=$(node --version | tr -d [:alpha:] | cut -c1-3)

if fcomp "$node_version" "$HP4T_NODEJS_MIN_VERSION";
then
  ~/.nvm/nvm.sh install stable;
fi;

# ==================== Install HeroinJS ====================

# npm install heroin-js@$HP4T_HEROIN_VERSION lodash@$HP4T_LODASH_VERSION
