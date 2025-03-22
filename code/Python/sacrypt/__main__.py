import sys
from . import process_text_v0, process_text_v1, print_frequency_markdown


def main():
    if len(sys.argv) < 2:
        print("Usage: python cryptanalysis.py <file_path>")
        sys.exit(1)

    file_path = sys.argv[1]
    if 'v1' in sys.argv:
        frequency = process_text_v1(file_path)
    else:
        frequency = process_text_v0(file_path)
    print_frequency_markdown(frequency)

if __name__ == "__main__":
    main()