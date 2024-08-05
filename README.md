# Tablecloth-ocaml-base

[![CircleCI](https://circleci.com/gh/darklang/tablecloth-ocaml-base.svg?style=shield)](https://circleci.com/gh/darklang/tablecloth-ocaml-base)
[![Opam](https://img.shields.io/badge/opam_package-0.8.0-brightgreen)](https://opam.ocaml.org/packages/tablecloth-ocaml-base)

Tablecloth is a library that shims over various standard libraries so they have the same function and module names, which using idiomatic types and patterns in each language.

This is the OCaml implementation, which uses Base, pipe-last, keyword arguments, and snake_case.

**Tablecloth is alpha-quality software, and is pre-1.0. It is currently undergoing
some significant shifts and some libraries listed below are not available yet.
Caveat emptor.**

Check out the [website](https://www.tablecloth.dev) for our interactive API
documentation, or join the community in the [Tablecloth
Discord](https://www.tablecloth.dev/discord-invite).

## Installation

**Note: these instructions are for the upcoming new version of tablecloth**

Install via opam:

`opam install tablecloth-ocaml-base`

Then add to your dune file:

`(libraries (tablecloth-ocaml-base ...))`

## Usage

The recommended way to use Tablecloth is with a top-level open at the beginning of a file.

This will ensure that all the built-in modules are replaced.

```
open Tablecloth

let () =
  String.to_list "somestring"
  |> List.map ~f:Char.to_code
  |> List.map ~f:(fun x -> x+1)
  |> List.filter_map ~f:Char.from_code
  |> String.from_list
```

## Supported versions

Tablecloth for native OCaml supports OCaml 4.10-4.14 with Base v0.15.1, and OCaml 4.14 and above with Base v0.16.3/v0.17.1.  We are open to supporting other versions:

- OCaml 4.06 and 4.07 require small tweaks to our build system
- Base v0.9 to v0.14 require small code changes

### Development

When developing Tablecloth, you can test it against different versions of
OCaml (native) and Base, using the following commands:

- `TC_BASE_VERSION=v0.16.3 TC_NATIVE_OCAML_SWITCH=5.2.0 make deps`

## Contributions

The maintainers are warm and friendly, and the project abides by a [Code of Conduct](./CODE_OF_CONDUCT.md).

There are many small tasks to be done - a small change to a single function can be extremely
helpful. We also welcome new versions of tablecloth for other languages, or even for the same
language but based on other libraries.

Check out the [dedicated guide](./documentation/contributing.md) on contributing for more.

## Developing

Please refer to the `Makefile` for a complete list of supported actions. Here is
a handful of useful, supported commands:

- `make deps`: Install OCaml dependencies.
- `make build`: Build the project.
- `make test`: Run the test suite. You may need to `make build` first.
- `make check-format`: Check your code is formatted correctly.
- `make format`: Format code.
- `cd ocamldoc-json-generator && make deps && make doc`: Build model.json for the website (needs to be updated and checked in whenever the APIs change.)

### Dependencies

- Install OCaml and OPAM [based on your OS](https://ocaml.org/docs/install.html)
- You may need to run `opam init`

## License

Tablecloth uses the [MIT](./LICENSE) license.

## Authors

Initially written by [Darklang](https://darklang.com).
