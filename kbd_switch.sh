#!/usr/bin/env bash

# Stripped down version of:
# http://ubuntuforums.org/showthread.php?t=1694284&p=10490345#post10490345

# List of languages:
LANGS=(us mn)

CURRENT_LANG=$(setxkbmap -print | awk -F+ '/xkb_symbols/{print substr($2,1,2)}')

i=0
while [[ $CURRENT_LANG != ${LANGS[$i]} ]] && [[ $i < $((${#LANG[@]}-2)) ]];
do
    i=$((i+1))
done

if [[ $i = $((${#LANGS[@]}-1)) ]]; then
    NEWLANG=${LANGS[0]}
else
    NEWLANG=${LANGS[$((i+1))]}
fi

setxkbmap "$NEWLANG"
