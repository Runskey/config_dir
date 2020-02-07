#!/bin/sh

JOURNAL_PATH='/Users/Lin/Documents/misc/writing/journal'
JOURNAL_NAME=`date +"%Y%m%d"`'.md'

JOURNAL_FILE=$JOURNAL_PATH/$JOURNAL_NAME

if [ ! -f $JOURNAL_FILE ]; then
  touch $JOURNAL_FILE
fi
