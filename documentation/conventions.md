---
title: "Conventions"
order: "2"
---

## t is the main type of a module

In OCaml it is a convention for the primary type of a module to be named `t`.

This means that when you want to refer to a type without `open`ing a module you don't end up repeating yourself:

```ocaml
let food: String.string = /* ... */

/* compared to */

let email: String.t = /* ... */
```

Since this is pervasive it also means your module can be used with [Functors](http://dev.realworldocaml.org/functors.html), as they almost always adhere to this convention.

## f is for function

Functions which take a function as an argument will almost always be a labelled argument named `f`.

Take [`Array.map`](/api#Array.map) as an example:

```ocaml
let map: 'a array -> f:('a -> 'b) -> 'b array;;
```

This means that it's easy to use these functions by either applying all of the
arguments:

```ocaml
Array.map ~f:(fun number -> number * 3) [|1; 2; 3|];;
```

or by chaining functions together using [`|>`](/api#Fun.pipe)

```ocaml
Array.filter ~f:Int.is_odd [|1; 2; 3|]
|> Array.map ~f:(fun number -> number * 3);;
```

## exn is for exception

The type for exceptions in OCaml is actually called `exn`.

You can read more about exceptions in [Real World OCaml](http://dev.realworldocaml.org/error-handling.html#scrollNav-2) or in the [OCaml manual](https://caml.inria.fr/pub/docs/manual-ocaml/coreexamples.html#s:exceptions).

## sep is for separator

[`Array.intersperse`](/api#Array.intersperse), [`Array.join`](/api#Array.join)
and their [`List`](/api#List) counterparts all take an element that will be used
as a separator.

Since this is a bit of a mouthful for a pretty commonly used function it gets shortened to `sep`.

## Function suffixes

Some functions come in multiple flavors.

Some of these flavors are so common they are distinguished by a really short suffix.

### ___2 is an alternative behaviour

When a function could behave in slightly different ways, but we want to provide the functionality of both, one of the implementations gets a two stuck on the end.

The best example of this is [`Float.atan2`](/api#Float.atan2)

### ___unsafe means "could raise an exception"

Some functions have 'unsafe' versions which instead of returning an [`Option`](/api#Option) or a [`Result`](/api#Result) could raise an exception.

Sometimes this can be for performance, and sometimes you just need an escape hatch.

See [`Option.unwrap`](/api#Option.unwrap) and [`Option.unwrap_unsafe`](/api#Option.unwrap_unsafe)

## Modules

### S is for signature, T is for module type

Functions which accept first class modules or functors need a way to label their arguments, and to avoid this being too long they are usually named `S` for the signature a functor returns and `T` for the input type.

In a similar way to modules primary type being [named `t`](#t-is-the-main-type-of-n-module)

## Labels for all arguments except Data

In OCaml, the convention is to have the data argument come last, as idiomatic
OCaml uses pipes (`|>`) heavily.  In Tablecloth, we do this by ensuring that
all arguments apart from the data argument use labelled arguments.

Note that this is the opposite the way standard libraries for related languages
like
[Elm](https://package.elm-lang.org/help/design-guidelines#the-data-structure-is-always-the-last-argument)
or
[Haskell](https://downloads.haskell.org/~ghc/latest/docs/html/libraries/base-4.13.0.0/GHC-List.html)
tend to do things.

## Check out the API

Now is a great time to jump straight into the [API](/api).

If you want to find out more about why Tablecloth exists and how you can help, read on.
