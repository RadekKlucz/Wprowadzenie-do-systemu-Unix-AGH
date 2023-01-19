#!/bin/bash

if [ $# -gt 1 ]; then
  echo "Too many arguments provided."
  exit 1
fi

if [ $# -eq 1 ]; then
  directory=$1
else
  directory=$(pwd)
fi

if [ ! -d $directory ]; then
  echo "Provided path is not a directory."
  exit 1
fi

if [ ! -r $directory ]; then
  echo "Directory cannot be read by current user."
  exit 1
fi

for file in $directory/*; do
  if [ -f $file ]; then
    name=$(basename $file)
    owner=$(ls -l $file | awk '{print $3}')
    size=$(stat --printf="%s" $file)
    if [ -x $file ]; then
      exec="WYK"
    else
      exec="NIEWYK"
    fi
    echo "$name $owner $size $exec"
  fi
done

exit 0