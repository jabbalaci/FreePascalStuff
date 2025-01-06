# Free Pascal Stuff

Tools, helper units, assets for Free Pascal.

## Multiline string

`multiline_str.py` converts a multiline string to Pascal code.

```text
$ ./multiline_str.py
Paste text here (exit: Ctrl-D):
here is
a test
^D
'here is' + LineEnding +
'a test';

# the text above was copied to the clipboard
```

Where `^D` indicates the Ctrl-D keypress.
If you want clipboard support, install the package `xsel` using your system's package manager (e.g., under Ubuntu: `sudo apt install xsel`).

## ASCII table

See `ascii.txt` .
