#!/bin/bash

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set $NAME label="$INFO" icon.background.image="app.$INFO" icon.background.image.scale=.3 icon.padding_right=20
fi
