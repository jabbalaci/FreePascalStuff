#!/usr/bin/env python3

"""
Run this script after ptop (Pascal autoformatter)
to fix some of the issues of ptop.

Author: Laszlo Szathmary (jabba.laci@gmail.com), 2025
"""

import sys
from pathlib import Path

INDENT = 2


def fix_line_after_uses(input_lines: list[str]) -> list[str]:
    fixed_lines = []
    i = 0
    while i < len(input_lines):
        line = input_lines[i]
        fixed_lines.append(line)

        # Look for "uses" pattern
        stripped = line.lower().strip()
        if stripped == "uses":
            while True:
                i += 1
                next_line = input_lines[i]
                if next_line.strip() == "":
                    fixed_lines.append(next_line)
                    break
                # else:
                stripped_next_line = next_line.lstrip()
                fixed_lines.append((" " * INDENT) + stripped_next_line)
            #
        #
        i += 1
    #
    return fixed_lines


def fix_elseif_indentation(input_lines: list[str]) -> list[str]:
    fixed_lines = []
    i = 0
    while i < len(input_lines):
        line = input_lines[i]
        fixed_lines.append(line)

        # Look for "else if" pattern
        stripped = line.lower().lstrip()
        if stripped.startswith("else if"):
            indents = len(line) - len(stripped)
            good_indents = indents + INDENT
            first_line_inside = True
            while True:
                i += 1
                next_line = input_lines[i]
                stripped_next_line = next_line.lstrip()
                indents_next_line = len(next_line) - len(stripped_next_line)
                if indents_next_line == indents:
                    fixed_lines.append(next_line)
                    break
                # else:
                if first_line_inside:
                    indents_to_remove = indents_next_line - good_indents
                #
                fixed_lines.append(next_line[indents_to_remove:])
                first_line_inside = False
            #
        #
        i += 1
    #
    return fixed_lines


def main() -> None:
    if len(sys.argv) != 3:
        p = Path(sys.argv[0])
        print(f"Usage: {p.name} input.pas output.pas")
        sys.exit(1)
    # else:
    input_file = sys.argv[1]
    output_file = sys.argv[2]

    try:
        # Read input file
        with open(input_file, "r") as f:
            lines = f.readlines()

        # Fix indentation
        lines = fix_elseif_indentation(lines)
        # Fix line after uses
        lines = fix_line_after_uses(lines)

        # Write output file
        with open(output_file, "w") as f:
            f.writelines(lines)

    except FileNotFoundError:
        print(f"Error: Could not find file {input_file}")
        sys.exit(1)
    except Exception as e:
        print(f"Error: {str(e)}")
        sys.exit(1)


if __name__ == "__main__":
    main()
