#!/bin/bash
op=${1:-+}
declare -i amnt
amnt=${2:-10}

# ---- CLANKER CONTRIBUTION ----
spotify=$(pactl list sink-inputs | awk '
  /Sink Input/ {i = $3; sub(/^#/, "", i)}
  /application\.process\.binary = "spotify"/ {print i}
')

# -------------- EOCC -----------
declare -i currVol
currVol=$(pactl list sink-inputs | grep -A10 "$spotify" | grep "Volume:" | grep -oP '/\s+\K[0-9]+(?=%)' | head -n 1)


echo "currVol='$currVol', amnt='$amnt', op='$op', spotifyId=$spotify"

if [[ "$op" == '+' ]] && (( currVol + amnt > 99 )); then
	pactl set-sink-input-volume "$spotify" 100%
else
	pactl set-sink-input-volume "$spotify" "${op}${amnt}%"
fi
