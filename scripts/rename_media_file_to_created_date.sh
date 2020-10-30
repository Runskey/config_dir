#!/bin/bash

apd=MOV

for file in *.$apd
  # do VARIABLE_DATE_OF_FILE=$(date -r $(stat -f %B $file) +%Y-%m-%d_%H-%M)
  do VARIABLE_DATE_OF_FILE=$(date -r $file +%Y-%m-%d_%H-%M-%S)
  mv -n "$file" "$VARIABLE_DATE_OF_FILE.$apd"
done
