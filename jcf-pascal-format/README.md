# jcf-pascal-format

JEDI Pascal code formatter from https://github.com/quadroid/jcf-pascal-format

`jabba.cfg`: my own, customized format settings

## Preparation

Compile the project (as described here: https://github.com/quadroid/jcf-pascal-format)
and put the binary (`pascal-format`) in this folder. Add this folder to your
`PATH`, thus you can call this code formatter from anywhere.

## Using it in VS Code

Install the extension [Run on Save](https://marketplace.visualstudio.com/items?itemName=emeraldwalk.RunOnSave) by emeraldwalk.

Then, add these lines to your `settings.json`:

```json
"emeraldwalk.runonsave": {
    "commands": [
      {
        "match": "\\.pas$",
        "isAsync": false,
        "cmd": "cd '${fileDirname}' && pascal-format -config=/home/jabba/Dropbox/pascal/FreePascalStuff/jcf-pascal-format/jabba.cfg '${fileBasename}'"
        },
    ]
  },
```

Of course, you'll have to customize the paths. Then,
whenever you save your Pascal code, it'll be
formatted automatically.

Note: I use one more Pascal plugin called "OmniPascal" (by Wosi).
