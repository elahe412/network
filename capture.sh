#!/bin/bash

###########################################################################
# Description:
#   This script captures network traffic on a specified interface using tshark.
#   It filters out SSH (port 22) traffic to avoid showing your terminal activity,
#   and displays selected fields such as source IP, destination IP, and protocols.
#
# Usage:
#   ./capture.sh <interface>
#   Example: ./capture.sh eth0
#
# Requirements:
#   - tshark must be installed (part of the Wireshark package)
#   - Run with sudo to allow packet capture
###########################################################################

if [ "$#" -ne 1 ]; then
    echo "Incorect args.Usage: $0 <interface>"
    exit 1
fi
sudo tshark -f "not port 22" -i "$1" -T fields \
-e ip.src \
-e ip.dst \
-e frame.protocols \
-E header=y
