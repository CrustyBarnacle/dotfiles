#!/usr/bin/env bash
# mpd-icon.sh — waybar custom/mpd icon module
# Outputs JSON so waybar can apply CSS classes per state

STATE=$(rmpc status 2>/dev/null | jq -r '.state // "Stop"')
FILE=$(rmpc song 2>/dev/null | jq -r '.file // ""')

case "$STATE" in
    "Play")
        if [[ "$FILE" == http* ]]; then
            CLASS="streaming"
            ICON=""   # FA radio tower
        else
            CLASS="playing"
            ICON=""   # FA play
        fi
        ;;
    "Pause")
        CLASS="paused"
        ICON=""       # FA pause
        ;;
    *)
        CLASS="stopped"
        ICON=""       # FA stop
        ;;
esac

printf '{"text": "%s", "class": "%s"}\n' "$ICON" "$CLASS"
