#!/bin/bash

if [[ -z "$PROGRAMMERNAME" || -z "$CHIPNAME" || -z "$ORIGINAL_FW" ]]; then
    echo "Not all the necessary variables are defined. Please, run 'run.sh'" >&2
    exit 1
fi

sudo flashrom -p "$PROGRAMMERNAME" -c "$CHIPNAME" -r "$ORIGINAL_FW".bin
if [[ "$?" -ne 0 ]]; then
    echo "No flash chip is found. Please, check the clip!" >&2
    exit 1
else
    sudo flashrom -p "$PROGRAMMERNAME" -c "$CHIPNAME" -r "$ORIGINAL_FW"_2.bin
    sudo flashrom -p "$PROGRAMMERNAME" -c "$CHIPNAME" -r "$ORIGINAL_FW"_3.bin
fi

COMPARISON_1=$(diff "$ORIGINAL_FW".bin "$ORIGINAL_FW"_2.bin)
COMPARISON_2=$(diff "$ORIGINAL_FW".bin "$ORIGINAL_FW"_3.bin)

if [[ "$COMPARISON_1" == "" && "$COMPARISON_2" == "" ]]; then
    echo "Everything is OK!"
    rm -f "$ORIGINAL_FW"_2.bin "$ORIGINAL_FW"_3.bin
else
    echo "ROM dumps are different! Please, check the clip!" >&2
fi
