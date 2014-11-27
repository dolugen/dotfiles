#!/usr/bin/env bash

CURRENT_LANG=$(setxkbmap -print | awk -F+ '/xkb_symbols/{print substr($2,1,2)}')

echo $CURRENT_LANG
