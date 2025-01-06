# Free Pascal Stuff

Tools, helper units, assets for Free Pascal.


## ptop (autoformatter)

See the folder `ptop/`

`ptop` is a source code formatter that you get
together with `fpc`. Basic usage:

```bash
$ ptop input.pas output.pas
```

Its default settings are quite strange. For instance,
it capitalizes the keywords (`begin` becomes `Begin`, etc.).
I didn't like that so I customized its configuration a bit.

* `config.original.cfg`: the default config of ptop.
  You can generate it with `ptop -g config.txt`
* `config.cfg`: my own settings

After tweaking the config of ptop, I still couldn't solve some
issues, thus I made a small Python script that does some
post-processing after ptop. Usage:

```bash
$ ./post_correction.py input.pas output.pas
```

To sum up, here are the necessary steps to beautify a source code:

```bash
$ TEMP=temp.hh6455.pas  # a temporary file with a unique name
$ ptop -c config.cfg input.pas $TEMP
$ mv $TEMP input.pas
$ ./post_correction.py input.pas $TEMP
$ mv $TEMP input.pas
```


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


## Jabba unit

See the folder `jabba_unit/`

This is a general-purpose helper unit that I often
use in my projects.
