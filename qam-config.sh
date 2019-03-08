#!/bin/bash

defaultConfigFolder="$HOME/.config/qubes-auto-mount"

./qam-config-defaults.sh

source "$defaultConfigFolder/dev-labels.conf"
source "$defaultConfigFolder/dev-uuids.conf"

if [[ $1 == "add" && $# == 3 ]]; then

    if [ $2 == "label" ]; then

        printf "devLabelCount=%d\n" `addition=$(($devLabelCount + 1)) ; printf "$addition"` > "$defaultConfigFolder/dev-labels.conf"

        j=0
        for i in ${devLabel[@]}
        do
            printf "devLabel[%d]=\"%s\"\n" $j $i >> "$defaultConfigFolder/dev-labels.conf"
            j=$(($j + 1))
        done

        printf "devLabel[%d]=\"%s\"\n" $j $3 >> "$defaultConfigFolder/dev-labels.conf"

        echo "Device with label \"$3\" will now mount automatically when attached. Restart your qube to see changes." 

    elif [ $2 == "uuid" ]; then

        printf "devUuidCount=%d\n" `addition=$(($devUuidCount + 1)) ; printf "$addition"` > "$defaultConfigFolder/dev-uuids.conf"

        j=0
        for i in ${devUuid[@]}
        do
            printf "devUuid[%d]=\"%s\"\n" $j $i >> "$defaultConfigFolder/dev-uuids.conf"
            j=$(($j + 1))
        done

        printf "devUuid[%d]=\"%s\"\n" $j $3 >> "$defaultConfigFolder/dev-uuids.conf"

        echo "Device with uuid \"$3\" will now mount automatically when attached. Restart your qube to see changes."

    else
        echo "Invalid arguments."
    fi

elif [[ $1 == "del" && $# == 3 ]]; then

    if [ $2 == "label" ]; then

        j=0
        deviceFound=0
        for i in ${devLabel[@]}
        do

            if [ $i == $3 ]; then
                unset devLabel[$j]
                deviceFound=1
            fi

            j=$(($j + 1))
        
        done

        if [ $deviceFound == 0 ]; then
            echo "Device with label \"$3\" not present in config; no need to delete it"
            exit 1
        fi
        
        printf "devLabelCount=%d\n" `addition=$(($devLabelCount - 1)) ; printf "$addition"` > "$defaultConfigFolder/dev-labels.conf"
        
        j=0
        for i in ${devLabel[@]}
        do

            printf "devLabel[%d]=\"%s\"\n" $j $i >> "$defaultConfigFolder/dev-labels.conf"

            j=$(($j + 1))
        
        done

        echo "Device with label \"$3\" will not be mounted automatically when attached anymore. Restart your qube to see changes."

    elif [ $2 == "uuid" ]; then

        j=0
        deviceFound=0
        for i in ${devUuid[@]}
        do

            if [ $i == $3 ]; then
                unset devUuid[$j]
                deviceFound=1
            fi

            j=$(($j + 1))
        
        done

        if [ $deviceFound == 0 ]; then
            echo "Device with uuid \"$3\" not present in config; no need to delete it"
            exit 1
        fi
        
        printf "devUuidCount=%d\n" `addition=$(($devUuidCount - 1)) ; printf "$addition"` > "$defaultConfigFolder/dev-uuids.conf"
        
        j=0
        for i in ${devUuid[@]}
        do

            printf "devUuid[%d]=\"%s\"\n" $j $i >> "$defaultConfigFolder/dev-uuids.conf"

            j=$(($j + 1))
        
        done

        echo "Device with uuid \"$3\" will not be mounted automatically when attached anymore. Restart your qube to see changes."

    else
        echo "Invalid arguments."
    fi

elif [[ $1 == "list" && $# == 1 ]]; then
    #TODO
    exit 0
elif [[ $1 == "list" && $# == 2 ]]; then

    if [ $2 == "label" ]; then
        #TODO
        exit 0
    elif [ $2 == "uuid" ]; then
        #TODO
        exit 0
    else
        echo "Invalid arguments."
    fi

else
    echo "Invalid arguments."
fi