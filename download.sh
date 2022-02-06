#!/bin/bash

sudo apt update
sudo apt install flashrom gnat-10 -y

git clone https://github.com/corna/me_cleaner.git
git clone --recursive https://review.coreboot.org/coreboot.git
cd coreboot/3rdparty
rm -r blobs
git clone https://review.coreboot.org/p/blobs.git
cd ../util/ifdtool
make
cd ../../..
