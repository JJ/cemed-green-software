#!/usr/bin/env python

import sys
import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))
from sacrypt import process_text_v0, process_text_v1, print_frequency_markdown

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python sacrypt-energy.py <file_path> [version]")
        sys.exit(1)
    file_path = sys.argv[1]
    version = sys.argv[2] if len(sys.argv) > 2 else "v0"

    if version == "v0":
        frequencies = process_text_v0( file_path)
    elif version == "v1":
        frequencies = process_text_v1( file_path)
    else:
        print("Invalid version. Use 'v0' or 'v1'.")
        sys.exit(1)

    print_frequency_markdown(frequencies)
