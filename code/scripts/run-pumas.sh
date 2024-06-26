#!/usr/bin/env sh

COMMANDS=$@
OUTPUT=baseline.json

for i in $(seq 15)
do
    pumas run -i100 --json > $OUTPUT & $COMMANDS
    kill $!
done