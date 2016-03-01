#!/usr/bin/env bash
set -e

if [ ! -d $HP4T_PROJECT_DIR/infrastructure ]; then
  echo "[HP4T] Infrastructure configration: initialising"
  cp -r $HP4T_TEMPLATES_DIR/infrastructure $HP4T_PROJECT_DIR/infrastructure
else
  echo "[HP4T] Infrastructure configration: exists - skipping"
fi
