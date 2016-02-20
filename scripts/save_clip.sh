#!/bin/bash

savepath=$HOME/.deft/

mkdir -p -- "$savepath"

snippet=$(xclip -o 2> /dev/null)
if [ -n "$snippet" ]
then
    echo "$snippet" > $savepath$(date +%Y%m%d%H%M%S).txt
fi

notify-send -i gtk-info -u low "Snippet was saved."
