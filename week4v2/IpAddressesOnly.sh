#!/bin/bash

#Display only IP address lines from Ipinfo.sh script

input="$(./IpInfo.sh)"

addresses=$(echo "$input" | sed -n '/IP Address/p')

echo -e "$addresses"