#!/usr/bin/env bash
set -e
set -o pipefail
echo ">>> Starting hcltm-action"
echo ""
if [ $1 = "validate" ]
then
  echo ">>>> Running validate"
  bash -c "set -e;  set -o pipefail; hcltm validate $2"
elif [ $1 = "dashboard" ]
then
  echo ">>>> Running dashboard"
  bash -c "set -e; set -o pipefail; hcltm dashboard -overwrite -outdir=$3 $2"
fi
