# Free Pascal Stuff

Tools, helper units, assets for Free Pascal.


## Jabba Utils

See the folder `JabbaUtils/`.

`JabbaUtils.pas` is my general-purpose helper unit that I often
use in my projects.

The folder may also include units written by other people.
Credits are given everywhere.


## ptop code formatter

See the folder `ptop/`.


## JEDI Pascal code formatter

See the folder `jcf-pascal-format/`. It's not perfect.
For instance, it didn't recognize the "generic" keyword
in a unit's interface part.


## ASCII table

See `ascii.txt`


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
