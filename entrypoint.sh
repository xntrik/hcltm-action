#!/usr/bin/env bash
set -e
set -o pipefail
echo ">>> Starting hcltm-action"
echo ""
if [ $1 = "validate" ]
then
  echo ">>>> Running validate"
  bash -c "set -e;  set -o pipefail; hcltm validate $2"
fi
