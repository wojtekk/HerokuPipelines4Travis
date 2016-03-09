#!/usr/bin/env bash
set -e

. ./variables.sh

if [ -d $HP4T_DESTINATION_DIR ]; then
  rm $HP4T_DESTINATION_DIR
fi
