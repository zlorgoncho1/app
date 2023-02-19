#!/bin/bash

load_env_file() {
  if [ -f "$1" ]; then
    export $(grep -v '^#' "$1" | xargs)
  fi
}

for env_file in $(find . -name "*.env"); do
  load_env_file "$env_file"
done