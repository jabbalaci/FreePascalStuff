# ptop (autoformatter)

`ptop` is a source code formatter that you get
together with `fpc`.

Basic usage:

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

## Using it in VS Code

Install the extension [Run on Save](https://marketplace.visualstudio.com/items?itemName=emeraldwalk.RunOnSave) by emeraldwalk.

Then, add these lines to your `settings.json`:

```json
"emeraldwalk.runonsave": {
    "commands": [
      {
        "match": "\\.pas$",
        "isAsync": false,
        "cmd": "cd '${fileDirname}' && ptop -l 100 -c /home/jabba/Dropbox/pascal/FreePascalStuff/ptop/config.cfg '${fileBasename}' '${fileBasename}.hjg6343.tmp' && mv '${fileBasename}.hjg6343.tmp' '${fileBasename}' && /home/jabba/Dropbox/pascal/FreePascalStuff/ptop/post_correction.py '${fileBasename}' '${fileBasename}.hjg6343.tmp' && mv '${fileBasename}.hjg6343.tmp' '${fileBasename}'"
      },
    ]
  },
```

Of course, you'll have to customize the paths. Then,
whenever you save your Pascal code, it'll be
formatted automatically.

Note: I use one more Pascal plugin called [OmniPascal](https://marketplace.visualstudio.com/items?itemName=Wosi.omnipascal) by Wosi.
