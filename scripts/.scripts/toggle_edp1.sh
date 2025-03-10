#!/bin/bash

# Check if eDP-1 is currently active
if hyprctl monitors | grep -q "eDP-1"; then
    hyprctl keyword monitor "eDP-1, disable"
else
    hyprctl keyword monitor "eDP-1, preferred, auto, 1.6"
fi
