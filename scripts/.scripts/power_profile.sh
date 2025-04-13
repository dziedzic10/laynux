#!/bin/bash
powerprofilesctl set "$1"
notify-send "Power Profile"  "$(powerprofilesctl get)"

