#!/bin/bash

defaultConfigFolder="$HOME/.config/qubes-auto-mount"

if [ ! -d "$HOME/.config" ]; then
	mkdir "$HOME/.config"
	mkdir $defaultConfigFolder
fi

if [ ! -d "$defaultConfigFolder" ]; then
	mkdir $defaultConfigFolder
fi

if [ ! -f "$defaultConfigFolder/dev-labels.conf" ]; then
	echo 'devLabelCount=0' > "$defaultConfigFolder/dev-labels.conf"
fi

if [ ! -f "$defaultConfigFolder/dev-uuids.conf" ]; then
	echo 'devUuidCount=0' > "$defaultConfigFolder/dev-uuids.conf"
fi