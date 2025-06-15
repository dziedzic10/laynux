#!/bin/bash

# Check if eDP-1 is currently active
if hyprctl monitors | grep -q "Samsung Electric Company C34J79x HNTW202213"; then
    hyprctl keyword monitor "desc:Samsung Electric Company C34J79x HNTW202213, disable"
else
    hyprctl keyword monitor "desc:Samsung Electric Company C34J79x HNTW202213,3440x1440@99.98Hz,auto,1.066667"
fi
