#!/usr/bin/env python

import string
from collections import Counter

def read_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        return file.read()

def eliminate_whitespace_and_punctuation(text):
    translator = str.maketrans('', '', string.whitespace + string.punctuation + '«»“”‘’')
    return ''.join(filter(str.isalpha, text.translate(translator)))

def calculate_frequency(text):
    return Counter(text.lower())

def print_frequency_markdown(frequency):
    print("| Symbol | Frequency |")
    print("|--------|-----------|")
    for symbol, freq in frequency.items():
        print(f"|   {symbol}   |    {freq}    |")

def main():
    file_path = 'data/malavoglia.txt'
    text = read_file(file_path)
    cleaned_text = eliminate_whitespace_and_punctuation(text)
    frequency = calculate_frequency(cleaned_text)
    print_frequency_markdown(frequency)

if __name__ == "__main__":
    main()