#!/usr/bin/env python

import string
from collections import Counter
import sys
import unicodedata

def read_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        return file.read()

def eliminate_whitespace_and_punctuation(text):
    translator = str.maketrans('', '', string.whitespace + string.punctuation + '«»“”‘’')
    text = ''.join(filter(str.isalpha, text.translate(translator)))
    return ''.join(
        c for c in unicodedata.normalize('NFD', text)
        if unicodedata.category(c) != 'Mn'
    )

def calculate_frequency(text):
    return Counter(text.lower())

def print_frequency_markdown(frequency):
    print("| Symbol | Frequency |")
    print("|--------|-----------|")
    for symbol, freq in frequency.items():
        print(f"|   {symbol}   |    {freq}    |")

def main():
    if len(sys.argv) != 2:
        print("Usage: python cryptanalysis.py <file_path>")
        sys.exit(1)

    file_path = sys.argv[1]
    text = read_file(file_path)
    cleaned_text = eliminate_whitespace_and_punctuation(text)
    frequency = calculate_frequency(cleaned_text)
    print_frequency_markdown(frequency)

if __name__ == "__main__":
    main()