import sys
from pyJoules.energy_meter import EnergyContext
from sacrypt import eliminate_whitespace_and_punctuation, calculate_frequency, print_frequency_markdown

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python sacrypt-baseline.py <file_path>")
        sys.exit(1)
    file_path = sys.argv[1]

with EnergyContext( start_tag="read_file") as ctx:
    with open(file_path, 'r', encoding='utf-8') as file:
        text = file.read()

    ctx.record("process_file")
    cleaned_text = eliminate_whitespace_and_punctuation(text)
    frequencies = calculate_frequency(cleaned_text)


