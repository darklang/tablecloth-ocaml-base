---
title: "Installation"
metaTitle: "Installation"
metaDescription: "Installing Tablecloth"
order: "0"
---

### Using Opam

```sh
opam install tablecloth-ocaml-base
```

Then update the libraries section in your `dune` file:

```clj
(libraries (tablecloth-ocaml-base))
```

### Using Esy

```sh
esy add @opam/tablecloth-ocaml-base
```

Then update the libraries section in your `dune` file:

```clj
(libraries (tablecloth-ocaml-base))
```
