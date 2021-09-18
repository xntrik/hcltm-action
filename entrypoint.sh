#!/usr/bin/env bash
set -e
set -o pipefail
echo ">>> Running command"
echo ""
if [ $1 = "validate" ]
then
  bash -c "set -e;  set -o pipefail; hcltm validate $2"
fi
