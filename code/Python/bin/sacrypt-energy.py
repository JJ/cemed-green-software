import sys
from pyJoules.energy_meter import measure_energy
from sacrypt import process_text_v0,process_text_v1

@measure_energy
def run_process(process_func, file_path):
    process_func(file_path)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python sacrypt-energy.py <file_path> [version]")
        sys.exit(1)
    file_path = sys.argv[1]
    version = sys.argv[2] if len(sys.argv) > 2 else "v0"

    if version == "v0":
        run_process(process_text_v0, file_path)
    elif version == "v1":
        run_process(process_text_v1, file_path)
    else:
        print("Invalid version. Use 'v0' or 'v1'.")
        sys.exit(1)
