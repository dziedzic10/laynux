#!/bin/bash

EXIT_NODE=$(tailscale exit-node suggest | sed -n 's/Suggested exit node: \(.*\)\./\1/p')
echo "Suggested exit node: $EXIT_NODE"

sudo tailscale up --reset --exit-node="$EXIT_NODE"
echo "Tailscale updated with new exit node."

read -p "Do you want to allow LAN access? (Y/n) " lan_access

if [[ "$lan_access" =~ ^[Nn]$ ]]; then
	sudo tailscale set --exit-node-allow-lan-access=false
	echo "LAN not allowed."
else
	sudo tailscale set --exit-node-allow-lan-access
	echo "LAN allowed." 
fi
tailscale status
