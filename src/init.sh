#!/usr/bin/env bash
set -e

# ==================== Install Heroku Toolbelt ====================

if command -v heroku 2>/dev/null; then
  echo "Heroku Toolbelt Installed"
else
  npm install heroku-cli -g
fi;

# ==================== Setup Heroku ====================

# Heroku credentials

echo "Set Heroku credentials"
netrc_content="machine git.heroku.com\n  login git\n  password $HEROKU_API_KEY"
echo -e $netrc_content >> ~/.netrc
