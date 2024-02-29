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
  additionaloptions=""
  if [ "$4" != "" ]
  then
    additionaloptions="${additionaloptions} -dashboard-template=${4}"
  fi
  if [ "$5" != "" ]
  then
    additionaloptions="${additionaloptions} -dashboard-filename=${5}"
  fi
  if [ "$6" = "true" ]
  then
    additionaloptions="${additionaloptions} -dashboard-html"
  fi
  if [ "$7" != "" ]
  then
    additionaloptions="${additionaloptions} -threatmodel-template=${7}"
  fi
  if [ "$9" != "" ]
  then
    additionaloptions="${additionaloptions} -out-ext=${9}"
  fi
  bash -c "set -e; set -o pipefail; hcltm dashboard -overwrite -outdir=$3 $additionaloptions $2"
elif [ $1 = "dfd" ]
then
  echo ">>>> Running dfd"
  additionaloptions=""
  if [ "$8" = "svg" ]
  then
    additionaloptions="-format=svg"
  fi
  if [ "$8" = "dot" ]
  then
    additionaloptions="-format=dot"
  fi
    
  bash -c "set -e; set -o pipefail; hcltm dfd -overwrite -outdir=$3 $additionaloptions $2"
elif [ $1 = "export" ]
then
  echo ">>>> Running export"
  additionaloptions=""
  if [ "$10" = "json" ]
  then
    additionaloptions="-format=json"
  fi
  if [ "$10" = "otm" ]
  then
    additionaloptions="-format=otm"
  fi

  bash -c "set -e; set -o pipefail; hcltm export -overwrite -output=$11 $additionaloptions $2"
fi
