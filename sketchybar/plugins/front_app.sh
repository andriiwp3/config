#!/bin/sh

if [ "$SENDER" = "front_app_switched" ]; then
  LABEL=$(echo $INFO | tr '[:upper:]' '[:lower:]')
  sketchybar --set "$NAME" label="$LABEL"
fi
