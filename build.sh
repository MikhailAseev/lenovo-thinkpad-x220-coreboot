#~/bin/bash

if [[ -z "$NOME_FW" || -z "$ORIGINAL_FW" || -z "$THINKPAD_X220" ]]; then
    echo "Not all the necessary variables are defined. Please, run 'run.sh'" >&2
    exit 1
fi

python me_cleaner/me_cleaner.py -SO "$NOME_FW".bin "$ORIGINAL_FW".bin
coreboot/util/ifdtool/ifdtool -x "$NOME_FW".bin

mkdir -p "$THINKPAD_X220"
mv flashregion_0_flashdescriptor.bin "$THINKPAD_X220"/descriptor.bin
mv flashregion_1_bios.bin "$THINKPAD_X220"/bios.bin
mv flashregion_2_intel_me.bin "$THINKPAD_X220"/me.bin
mv flashregion_3_gbe.bin "$THINKPAD_X220"/gbe.bin

cd coreboot
cp ../.config .
make crossgcc-i386 CPUS=$(nproc)
make iasl
make
cd ..
