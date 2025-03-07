#!/usr/bin/env bash

# Check command line arguments
if [[ "$#" != 1 || ! ("$1" == "inc" || "$1" == "dec") ]]; then
    printf "Usage: %s [inc|dec]\n" "$0" >&2
    exit 1
fi

# Check if brightnessctl is available
if ! command -v brightnessctl &> /dev/null; then
  echo "Error: brightnessctl is not installed. Please install it." >&2
  exit 1
fi


# Get current brightness percentage
current_brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)
brightness_percent=$(( (current_brightness * 100) / max_brightness ))

# Determine step size
if (( brightness_percent >= 0 && brightness_percent < 10 )); then
    step=1
else
    step=10
fi

# Perform brightness adjustment
if [[ "$1" == "inc" ]]; then
    brightnessctl set +"$step%" > /dev/null
elif [[ "$1" == "dec" ]]; then
    brightnessctl set "$step%-" > /dev/null
fi
