#!/bin/bash

export PROGRAMMERNAME=ch341a_spi
export CHIPNAME='MX25L6406E/MX25L6408E'
export ORIGINAL_FW=x220-original
export NOME_FW=x220-nome
export THINKPAD_X220=coreboot/3rdparty/blobs/mainboard/lenovo/x220

./download.sh && \
./read_bios.sh && \
./build.sh && \
./write_bios.sh
