#!/bin/bash

if hash dunmount 2>/dev/null; then
    echo "dunmount detected."
else
    echo "dunmount not found; it must be installed to run this script."
    echo "Please visit https://github.com/abbluiz/dmount for instructions."
fi

defaultConfigFolder="$HOME/.config/qubes-auto-mount"

qam-config-defaults

source "$defaultConfigFolder/dev-labels.conf"
source "$defaultConfigFolder/dev-uuids.conf"

if [ $devLabelCount -gt 0 ]; then

	j=0

	for i in ${devLabel[@]}
	do
		devLabelMountpointDir[$j]="$HOME/Device/$i"
		mountpoint -q "${devLabelMountpointDir[$j]}"
		devLabelMountpointStatus[$j]=$?
		j=$j+1
	done

fi

if [ $devUuidCount -gt 0 ]; then

	j=0

	for i in ${devUuid[@]}
	do
		devUuidMountpointDir[$j]="$HOME/Device/$i"
		mountpoint -q "${devUuidMountpointDir[$j]}"
		devUuidMountpointStatus[$j]=$?
		j=$j+1
	done

fi

while [ `for i in ${devLabelMountpointDir[@]}; do printf " -d $i -o "; done` `for i in ${devLabelMountpointStatus[@]}; do printf "$i == 0 -o "; done` `for i in ${devUuidMountpointDir[@]}; do printf " -d $i -o "; done` `for i in ${devUuidMountpointStatus[@]}; do printf "$i == 0 -o "; done` `printf "1 == 0"` ]
do

	j=0

	for i in ${devLabel[@]}
	do
		dunmount label $i
		mountpoint -q "${devLabelMountpointDir[$j]}"
		devLabelMountpointStatus[$j]=$?
		j=$j+1
	done

	j=0

	for i in ${devUuid[@]}
	do
		dunmount uuid $i
		mountpoint -q "${devUuidMountpointDir[$j]}"
		devUuidMountpointStatus[$j]=$?
		j=$j+1
	done

done