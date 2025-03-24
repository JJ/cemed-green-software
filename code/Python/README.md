# `sacrypt` , test code for SAC tutorial


To be delivered in SAC 25, Catania

## Instructions

Since this is using the RAPL interface, it's not going to work in non-Intel or AMD architectures.

1. Install uv
2. uv sync
3. Install nvml if needed

You can run the different versions of the program from `uv run`, by doing

1. `uv build`
2. `uv run sacrypt ../data/malavoglia.txt` with `v1` at the end for the fastest/least energy-spending version

## Description

we have a small program here that reads data from text files and computes frequencies. It does so in two different ways: using itertools and using "clean" clde, with separation of concerns. Code is in the `sacrypt` (SAC+cryptanalysis) in the `src` directory.
