#!/bin/bash

if [[ "$1" == "" ]]; then
    echo "usage: clean_fasta_names.sh <input-fasta>"
    echo "prints to stdout"
    exit 1
fi

sed -e 's/\(>..........\).*/\1/' "$1" ||\
    echo "sed failed - check pattern or something..."

# or use this in vim: ":%s/\(>..........\).*/\1/"
