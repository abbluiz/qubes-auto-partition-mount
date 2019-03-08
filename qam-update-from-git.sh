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

~/.qam-tmp/qam-install.sh

echo "Deleting temporary directory $HOME/.qam-tmp"
rm -rf ~/.qam-tmp

echo "All scripts updated from git."