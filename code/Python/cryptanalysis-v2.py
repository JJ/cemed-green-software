#!/usr/bin/env python

from collections import Counter
from itertools import chain
import sys

def print_frequency_markdown(frequency):
    print("| Symbol | Frequency |")
    print("|--------|-----------|")
    for symbol, freq in sorted(frequency.items(), key=lambda item: item[1]):
        print(f"|   {symbol}   |    {freq}    |")

def main():
    if len(sys.argv) != 2:
        print("Usage: python cryptanalysis.py <file_path>")
        sys.exit(1)

    file_path = sys.argv[1]
    with open(file_path, 'r', encoding='utf-8') as file:
        frequency = Counter(chain.from_iterable(line.lower() for line in file))

    for symbol in list(frequency.keys()):
        if not symbol.isalpha():
            del frequency[symbol]
    print_frequency_markdown(frequency)

if __name__ == "__main__":
    main()