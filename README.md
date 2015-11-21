# lein-sepal-repl

A Leiningen plugin to run Sepal.clj in `lein repl`

Based on https://github.com/Cirru/sepal-repl.clj

## Usage

```clojure
:plugins [lein-sepal-repl "0.0.1"]
```

and start REPL with:

```bash
rlwrap lein sepal-repl
```

### Where's Clojure code?

Code is generated from Sepal.clj with:

```bash
lein cirru-repl
```

## License

Copyright © 2015 jiyinyiyong

Distributed under the Eclipse Public License either version 1.0 or (at
your option) any later version.
