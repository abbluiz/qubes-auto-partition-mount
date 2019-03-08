#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." 
   exit 1
fi

if [ ! -e "~/.qam-tmp" ]; then
    mkdir ~/.qam-tmp
else
    rm -rf ~/.qam-tmp
    mkdir ~/.qam-tmp
fi

git clone https://github.com/abbluiz/qubes-auto-partition-mount.git ~/.qam-tmp

# TODO: diff

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

updatingOrInstalling() {

    if [ -x "$2/$3" ]; then
        report="Updating"
    else
        report="Installing"
    fi

}

for i in ${script[@]}
do 

    report="Installing/Updating"
    updatingOrInstalling $report $installPath $i
    echo "$report $i..."
    install "~/.qam-tmp/$i.sh" "$installPath/$i"

done

echo "Deleting temporary directory $HOME/.qam-tmp"
rm -rf ~/.qam-tmp

echo "All scripts updated from git."