#!/bin/sh

if osascript -e 'application "Spotify" is running' &>/dev/null; then
  STATE=$(osascript -e 'tell application "Spotify" to get player state' 2>/dev/null)
  if [ "$STATE" = "playing" ]; then
    TRACK=$(osascript -e 'tell application "Spotify" to get name of current track' 2>/dev/null)
    ARTIST=$(osascript -e 'tell application "Spotify" to get artist of current track' 2>/dev/null)
    if [ -n "$TRACK" ] && [ -n "$ARTIST" ]; then
      NEW_LABEL="$TRACK - $ARTIST"
      sketchybar --set "$NAME" drawing=on label="$NEW_LABEL"
      exit 0
    fi
  fi
fi
