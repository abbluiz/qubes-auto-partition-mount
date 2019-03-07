#!/bin/bash

defaultConfigFolder="$HOME/.config/qubes-auto-mount"

if [ ! -d "$HOME/.config" ]; then
	mkdir "$HOME/.config"
	mkdir $defaultConfigFolder
fi

if [ ! -e "$defaultConfigFolder/dev-labels.conf" ]; then
	echo 'devLabelCount=0' > "$defaultConfigFolder/dev-labels.conf"
fi

if [ ! -e "$defaultConfigFolder/dev-uuids.conf" ]; then
	echo 'devUuidCount=0' > "$defaultConfigFolder/dev-uuids.conf"
fi