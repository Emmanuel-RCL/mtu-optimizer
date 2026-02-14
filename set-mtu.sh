#!/bin/bash

#############################################
# MTU Configuration Tool
# Developer: Seyyed Ali Habibpour
# Website: https://reycloud.ir
# Description: Set custom MTU easily with default 1380
#############################################

clear

echo "========================================="
echo "          MTU Configuration Tool         "
echo "           Default MTU = 1380           "
echo "========================================="
echo "Developer: Seyyed Ali Habibpour"
echo "Website: https://reycloud.ir"
echo "========================================="
echo ""

# Check root
if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run as root"
  exit 1
fi

# Show interfaces
echo "Available network interfaces:"
ip -o link show | awk -F': ' '{print $2}'
echo ""

# Ask interface
read -p "Enter interface name [eth0]: " IFACE
IFACE=${IFACE:-eth0}

# Check interface exists
if ! ip link show "$IFACE" > /dev/null 2>&1; then
    echo "Error: Interface not found!"
    exit 1
fi

# Ask MTU
read -p "Enter MTU value [1380]: " MTU
MTU=${MTU:-1380}

# Validate MTU
if ! [[ "$MTU" =~ ^[0-9]+$ ]]; then
    echo "Error: Invalid MTU value!"
    exit 1
fi

echo ""
echo "Applying MTU $MTU on interface $IFACE ..."
echo ""

# Apply MTU
ip link set dev "$IFACE" mtu "$MTU"

# Show result
ip link show "$IFACE" | grep mtu

echo ""
read -p "Make MTU persistent after reboot? [Y/n]: " PERSIST
PERSIST=${PERSIST:-Y}

if [[ "$PERSIST" == "Y" || "$PERSIST" == "y" ]]; then

    if [ -d /etc/netplan ]; then

        CONFIG=$(ls /etc/netplan/*.yaml 2>/dev/null | head -n 1)

        if [ -n "$CONFIG" ]; then

            cp "$CONFIG" "$CONFIG.bak"

            sed -i "/$IFACE:/a \ \ \ \ mtu: $MTU" "$CONFIG"

            netplan apply

            echo "Persistent MTU saved via netplan."

        else
            echo "Netplan config not found."
        fi

    else

        echo "post-up ip link set dev $IFACE mtu $MTU" >> /etc/network/interfaces

        echo "Persistent MTU saved in /etc/network/interfaces"

    fi

fi

echo ""
echo "========================================="
echo " MTU configuration completed successfully"
echo "========================================="
echo ""
