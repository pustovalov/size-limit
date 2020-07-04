#!/bin/bash

file_path="$HOME/node-warnings.logs"

node --redirect-warnings=$file_path packages/size-limit/test/max-litsteners-test.js

if grep -q MaxListenersExceededWarning "$file_path"; then
  echo "Possible EventEmitter memory leak detected"
  exit 1
fi
