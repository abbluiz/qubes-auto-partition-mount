#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." 
   exit 1
fi

installPath="/usr/local/bin"

script[0]="qam-config-defaults"
script[1]="qam-config"
script[2]="qam-rc-install"
script[3]="qam-rc-uninstall"
script[4]="qam-uninstall"
script[5]="qam-startup"
script[6]="qubes-auto-mount"
script[7]="qubes-auto-unmount"
script[8]="qam-update-from-git"

for i in ${script[@]} 
do 
    if [ -x "$installPath/$i" ]; then
        echo "Uninstalling $i script..."
        rm "$installPath/$i"
    fi
done

echo "All scripts uninstalled."