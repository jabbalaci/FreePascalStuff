#!/usr/bin/env python3

"""
Multiline string to Pascal code converter.

Requirement:
* the "xsel" Linux command (install it with your package manager)

Author: Laszlo Szathmary (jabba.laci@gmail.com), 2025
"""

import shlex
import subprocess
import sys
from subprocess import PIPE, STDOUT, Popen

COPY_RESULT_TO_CLIPBOARD = True
# COPY_RESULT_TO_CLIPBOARD = False


def get_simple_cmd_output(cmd: str, stderr=STDOUT) -> str:
    args = shlex.split(cmd)
    return Popen(args, stdout=PIPE, stderr=stderr).communicate()[0].decode("utf8")


def to_clipboard(text: str) -> None:
    xsel_proc = subprocess.Popen(["xsel", "-bi"], stdin=subprocess.PIPE)
    xsel_proc.communicate(text.encode("utf8"))


def convert(line: str) -> str:
    line = line.replace("'", "''")
    return line


def process(lines: list[str]) -> None:
    last_idx = len(lines) - 1
    result = ""
    for idx, line in enumerate(lines):
        line = convert(line)
        result += f"'{line}'"
        if idx < last_idx:
            result += " + LineEnding +\n"
        else:
            result += ";"
        #
    #
    print(result)
    if COPY_RESULT_TO_CLIPBOARD:
        to_clipboard(result)
        print()
        print("# the text above was copied to the clipboard")


def main() -> None:
    print("Paste text here (exit: Ctrl-D):")
    lines: list[str] = sys.stdin.read().splitlines()
    print()
    process(lines)


##############################################################################

if __name__ == "__main__":
    main()
