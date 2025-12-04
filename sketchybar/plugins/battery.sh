#!/bin/sh

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  9[0-9]|100) ICON=$BATTERY_FULL
  ;;
  [6-8][0-9]) ICON=$BATTERY_ALMOST_FULL
  ;;
  [3-5][0-9]) ICON=$BATTERY_HALF
  ;;
  [1-2][0-9]) ICON=$BATTERY_LOW
  ;;
  *) ICON=$BATTERY_EMPTY
esac

if [[ "$CHARGING" != "" ]]; then
  ICON=$BATTERY_CHARGING
fi

if [ "$PERCENTAGE" -le 10 ]; then
  COLOR="$BATTERY_LOW"
elif [ "$PERCENTAGE" -le 20 ]; then
  COLOR="$BATTERY_MID"
else
  COLOR="$BATTERY_NORMAL"
fi

sketchybar --set "$NAME" icon="$ICON" \
                         label="${PERCENTAGE}%" \
                         icon.color="$COLOR" \
                         label.color="$COLOR"
