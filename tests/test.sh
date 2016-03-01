#!/usr/bin/env bash

EXIT_CODE=0

cd tmp/

../bin/setup.sh

if [ ! -d "scripts/hp4t" ]; then
  EXIT_CODE=1
  echo "ERROR: link scripts/hp4t does not exists";
fi
