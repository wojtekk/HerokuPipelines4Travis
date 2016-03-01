#!/usr/bin/env bash
set -e

if [ ! -f $HP4T_PROJECT_DIR/.travis.yml ]; then
  echo "[HP4T] Travis configuration: initialising"
  cp $HP4T_TEMPLATES_DIR/travis/composer/.travis.yml $HP4T_PROJECT_DIR/.travis.yml
else
  echo "[HP4T] Travis configuration: exists - skipping"
fi
