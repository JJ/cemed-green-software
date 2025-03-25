#!/usr/bin/env sh

# Pumas is the power usage monitor for Apple Silicon

FILENAME=$1

for i in 512 1024 2048
do
    echo "Size ${i}"
    OUTPUT="${FILENAME}-${i}.json"
    echo "Saving to ${OUTPUT}"
    pumas run -i 100 --json > $OUTPUT &
    for j in $(seq 15)|
    do
        C++/chromosomes $i
    done
    kill $!
done
