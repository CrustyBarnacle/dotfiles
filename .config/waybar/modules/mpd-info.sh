#!/usr/bin/env bash
# mpd-info.sh — waybar custom/mpd-info drawer module
# Outputs empty string when stopped (drawer collapses to icon only)
# Handles streaming vs local, omits empty fields silently

STATE=$(rmpc status 2>/dev/null | jq -r '.state // "Stop"')

# Output nothing when stopped — drawer will show only the icon
[ "$STATE" = "Stop" ] && exit 0

SONG=$(rmpc song 2>/dev/null)
FILE=$(echo "$SONG" | jq -r '.file // ""')
TITLE=$(echo "$SONG" | jq -r '.metadata.title // ""')

if [[ "$FILE" == http* ]]; then
    # Streaming — use station name + current track title
    STATION=$(echo "$SONG" | jq -r '.metadata.name // ""')

    if [ -n "$STATION" ] && [ -n "$TITLE" ]; then
        echo "$STATION  ·  $TITLE"
    elif [ -n "$STATION" ]; then
        echo "$STATION"
    elif [ -n "$TITLE" ]; then
        echo "$TITLE"
    else
        echo "Streaming"
    fi
else
    # Local — artist · title, album in tooltip via separate format
    ARTIST=$(echo "$SONG" | jq -r '.metadata.artist // ""')

    PARTS=()
    [ -n "$ARTIST" ] && PARTS+=("$ARTIST")
    [ -n "$TITLE" ]  && PARTS+=("$TITLE")

    if [ "${#PARTS[@]}" -gt 0 ]; then
        (IFS='·'; echo "${PARTS[*]}" | sed 's/·/  ·  /g')
    fi
fi
