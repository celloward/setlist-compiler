# Dancify
Takes a YAML layout of tune information broken into sets and abc formatted tune filepaths and creates a single .abc file that (hopefully) nicely formats into a dance without the copy-paste.

## Installation
Aside from `git clone <etc.>` you should also

### Set your source directory
Right now this program only handles a single path. Future features would ideally include setting multiple possible paths to search for the file in so one is not locked into a single filepath for all tune files.

This can be done either by directly editing the `source_path` file, but be sure to use the absolute path so it can be found (i.e. prefix your path with `~/`.

Alternatively you can use irb
- Open irb in repo
```ruby
require './source_path
s = SourcePath.new
s.full_path = # <whatever your path from root will be>
s.save_path
```

### Make script globally executable
From terminal in repo `chmod +x ./dancify.rb.

Then from root: `export PATH=$PATH:~/<path to dancify>`

### Make an alias
For ease of calling in your .bashrc or whatever:
```sh
alias dancify='dancify.rb'
```

## Running the program
Ensure that you have set your source directory from where tunes will be pulled. The files should be in .abc format. You can see examples of these files in the `sample-tunes` folder in this repo.

Create a .yml file along the lines of the sample.yml in this repo.

If you haven't aliased, run `dancify.rb <path/to/yaml> <optional/output/filepath>`

If you don't specify a filepath and name, it will default to spitting out the resultant abc file in `~/intermediate.abc`

## Further handling
Once you have your beautiful .abc setlist compiled, you can further convert it into real notes by putting the following handy script in your .bashrc.
```sh
function tune() {
  bn=$(basename $(basename "$1" .abc) .)
  abcm2ps "$bn.abc" -O "$bn.ps" && ps2pdf "$bn.ps" && rm "$bn.ps"
}
```

You may then call `tune <filepath to .abc file>` and you will have a .pdf of the notes by the same filename.

NB: having ps2pdf installed on your machine is a prerequisite to the magic of the above shell script to work.
