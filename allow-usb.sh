#!/bin/bash

# allow-usb.sh
# Author: Éric Tellier
# Licence: MIT License

function checkpoint(){
    read -r -p "Continuer ? [o/N] " response
    if [[ ! "$response" =~ ^([oO]|[yY])$ ]]; then
        exit 1
    fi
}


NL='
'

blocked_devices_id=$(usbguard list-devices | grep block | awk '{print $1}' FS=":")


if [ -n "$blocked_devices_id" ]; then
    if [[ "$blocked_devices_id" == *"$NL"* ]]; then
        echo -e "\e[91m[ ERREUR ] Plusieurs périphériques USB non autorisés ont été insérés :\e[0m"
        device_name=$(usbguard list-devices | grep block | awk -F'name "|"' '{print $4}')
        echo "${device_name}" | awk '{print "   - " $0}'
        echo -e "\e[91m Abandon\e[0m"
        exit 1
    else
        echo -e "\e[92m[  OK  ] Un seul périphérique détecté.\e[0m"
        device_name=$(usbguard list-devices | grep block | awk -F'name "|"' '{print $4}')
        echo -e "Nom du périphérique :${device_name}"
        checkpoint
    fi
    last_blocked_device_id=$(echo $blocked_devices_id | awk '{print $NF}')
    if [[ "$1" == "--test" ]]; then
        echo -e "\e[93m[ TEST ] Le périphérique USB avec l'ID $last_blocked_device_id aurait été ajouté à la liste blanche.\e[0m"
        exit 0
    else
        usbguard allow-device $last_blocked_device_id
        echo -e "\e[92mLe périphérique USB avec l'ID $last_blocked_device_id a été ajouté à la liste blanche.\e[0m"
        exit 0
    fi
else
    echo "Aucun périphérique USB bloqué trouvé."
fi
