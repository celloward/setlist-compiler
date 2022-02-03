# Setlist Compiler
Takes a YAML layout of tune information broken into sets and abc formatted tune filepaths and creates a single .abc file that (hopefully) nicely formats into a dance without the copy-paste.

## Prereqs
Ruby version >= 2.6.3

For converting from abc to pdf you need
- [abcm2ps](https://github.com/lewdlime/abcm2ps)
- [ps2pdf](https://web.mit.edu/ghostscript/www/Ps2pdf.htm)

Also you need some abc files in a directory. For more info about the abc music notation system see [this page](https://abcnotation.com/wiki/abc:standard:v2.1).

## Installation
Aside from `git clone <etc.>` you should also

### Make script globally executable
From terminal in repo `chmod +x ./compile-setlist` and `chmod +x ./set-source-path`

Then from root: `export PATH=$PATH:~/<path to compile-setlist>`

### Set your source directory
This can be done either by running `set-source-path <the/path/to/tunes>` or by directly editing the `lib/source/source_path` file, but be sure to use the absolute path so it can be found (i.e. prefix your path with `~/`)

## Running the program
Ensure that you have set your source directory from where tunes will be pulled. The files should be in .abc format. You can see examples of these files in the `samples/sample-tunes` folder in this repo.

Create a .yml file along the lines of the `samples/sample.yml` in this repo.

Run `compile-setlist <path/to/yaml> <optional/output/filepath>`

If you don't specify a filepath and name, it will default to spitting out the resultant abc file in `~/intermediate.abc`

## Further handling
Once you have your beautiful .abc setlist compiled, you can further convert it into real notes by putting the following clever script from @tsmacdonald in your .bashrc.
```sh
function tune() {
  bn=$(basename $(basename "$1" .abc) .)
  abcm2ps "$bn.abc" -O "$bn.ps" && ps2pdf "$bn.ps" && rm "$bn.ps"
}
```

You may then call `tune <filepath to .abc file>` and you will have a .pdf of the notes by the same filename.
