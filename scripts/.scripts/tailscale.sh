#!/bin/bash

EXIT_NODE=$(tailscale exit-node suggest | sed -n 's/Suggested exit node: \(.*\)\./\1/p')
echo "Suggested exit node: $EXIT_NODE"

sudo tailscale up --reset --exit-node="$EXIT_NODE"
echo "Tailscale updated with new exit node."

read -p "Do you want to allow LAN access? (N/y) " lan_access

if [[ "$lan_access" =~ ^[Yy]$ ]]; then
	sudo tailscale set --exit-node-allow-lan-access
	echo "LAN allowed." 
else
	sudo tailscale set --exit-node-allow-lan-access=false
	echo "LAN not allowed."
fi

read -p "Do you want to accept routes? (N/y) " accept_routes

if [[ "$accept_routes" =~ ^[Yy]$ ]]; then
	sudo tailscale set --accept-routes
	echo "Routes allowed." 
else
	sudo tailscale set --accept-routes=false
	echo "Routes not allowed."
fi
tailscale status
