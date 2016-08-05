# nan

Get help information for a command, no matter what.

## Usage

Curious about a command, but you're tired of seeing this?

```bash
$ man bpkg
No manual entry for bpkg
See 'man 7 undocumented' for help when manual pages are not available.
```

No more! Get man-page-like output from `nan`, all conveniently viewable in `less`
just like `man`'s output:

```bash
$ nan bpkg
```

Produces output like:

```
  usage: bpkg [-hV] <command> [args]


Here are some commands available in your path:

    getdeps
    init
    install
    json
    list
    package
    show
    suggest
    term
    update
    utils
(END)
```

`nan` offers help information for...

 - commands that already have man pages (it's equivalent to `man` in that case)
 - shell builtins like `cd`, `return`, `help`, etc.
 - commands that support arguments like `--help`, `-h`, or `help`

It's compatible with multi-word commands too (like `nan git status`)!

## Install

Available as a [bpkg](http://www.bpkg.io/)

```sh
$ bpkg install [-g] nfischer/nan
```

## Use `nan` instead of `man`

Want to ditch `man` and use `nan` instead? Feel free to use the following alias:

```bash
$ alias man=nan
```
