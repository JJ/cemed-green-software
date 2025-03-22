#!/usr/bin/env python

import string
from collections import Counter
from itertools import chain
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
    for symbol, freq in sorted(frequency.items(), key=lambda item: item[1]):
        print(f"|   {symbol}   |    {freq}    |")

def process_text_v0(file_path):
    text = read_file(file_path)
    cleaned_text = eliminate_whitespace_and_punctuation(text)
    return calculate_frequency(cleaned_text)


def process_text_v1(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        frequency = Counter(chain.from_iterable(line.lower() for line in file))

    for symbol in list(frequency.keys()):
        if not symbol.isalpha():
            del frequency[symbol]
    return frequency