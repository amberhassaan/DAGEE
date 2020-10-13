#!/bin/bash 

# Basic steps
# - clone examples repo in d1
# - clone release repo in d2
# - cd d1
# - traverse d1 while ignoring the IGNORE_LIST and copy to d2
# - cd d2
# - git commit -a -m 'update msg'
# - git push 
# - remove d1 and d2

DEV_URL="git@gitlab1:AsyncTasking/DAGEE-examples"
REL_URL="git@gitlab1:AsyncTasking/DAGEE-release-RO"

DEV_DIR="$HOME/projects/DAGEE-examples"
REL_DIR="$HOME/projects/DAGEE-release-RO"

## TODO: clone to tmp dirs

cd $DEV_DIR

for d in $(find . -type d | egrep -iv '\.git') ; do 
  echo "Found dir: $d"
  if ! [ -d $REL_DIR/$d ]; then 
    mkdir $REL_DIR/$d
  fi
done

for f in $(find . -type f | egrep -iv '\.git') ; do 
  echo "Found file: $f"
  cp -af $f $REL_DIR/$f
done
