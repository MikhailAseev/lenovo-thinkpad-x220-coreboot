#!/bin/bash

if [[ -z "$PROGRAMMERNAME" || -z "$CHIPNAME" ]]; then
    echo "Not all the necessary variables are defined. Please, run 'run.sh'" >&2
    exit 1
fi
sudo flashrom -p "$PROGRAMMERNAME" -c "$CHIPNAME" -w coreboot/build/coreboot.rom
