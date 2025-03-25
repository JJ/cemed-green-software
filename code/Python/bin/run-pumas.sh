#!/usr/bin/env sh

# Pumas is the power usage monitor for Apple Silicon

FILENAME=$1

for i in 3romanzi malavoglia manzoni_i_promessi_sposi_1840
do
    echo "File ${i}"
    OUTPUT="${FILENAME}-${i}.json"
    echo "Saving to ${OUTPUT}"
    pumas run -i 100 --json > $OUTPUT &
    for j in $(seq 30)
    do
        bin/sacrypt-mac.py ../data/$i.txt
    done
    kill $!
done
