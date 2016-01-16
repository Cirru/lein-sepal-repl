# lein-sepal-repl

A Leiningen plugin to run Sepal.clj in `lein repl`

Based on https://github.com/Cirru/sepal-repl.clj

## Usage

[![Clojars Project](http://clojars.org/cirru/lein-sepal-repl/latest-version.svg)](http://clojars.org/cirru/lein-sepal-repl)

```clojure
:plugins [[cirru/lein-sepal-repl "0.0.7"]]
```

Or just the version:

```clojure
[cirru/lein-sepal-repl "0.0.7"]
```

and start REPL with:

```bash
rlwrap lein sepal-repl
```

Here's a demo of running:

```text
➤➤ rlwrap lein sepal-repl
Starting REPL for Sepal.clj ...
sepal> println 1 2
    -> (println 1 2)
1 2
    <- nil
sepal> (print 1 2)
    -> (print 1 2)
1 2    <- nil
sepal> ^D
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
