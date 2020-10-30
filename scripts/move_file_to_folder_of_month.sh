#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for entry in *
do
  MONTH_DIR=`date -r $entry +%m`
  [ ! -d $MONTH_DIR ] && mkdir $MONTH_DIR
  [ -f $entry ] && mv $entry $MONTH_DIR/
done
IFS=$SAVEIFS



