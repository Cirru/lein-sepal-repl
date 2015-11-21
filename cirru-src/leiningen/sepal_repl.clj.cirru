
ns leiningen.sepal-repl
  :require
    [] leiningen.core.eval :as eval
    [] cirru.sepal :refer $ [] transform-x
    [] cirru.parser-combinator :refer $ [] pare
    [] clojure.term.colors :refer :all
    [] clojure.pprint :as pp
    [] fipp.edn :refer
      [] pprint
      , :rename $ {} (pprint fipp)

defn- eval-lines (project lines)
  if (> (count lines) 0)
    let
        quoted-code $ transform-x (first lines)
        _ $ println $ magenta
          str "|    -> "
            with-out-str $ pp/write quoted-code
        result $ try
          eval/eval-in-project project quoted-code
          catch Exception e
            println e
      print $ blue "|    <- "
      fipp result
      recur project (rest lines)

defn- eval-print (project)
  print $ blue "|sepal> "
  flush
  let
      code $ read-line
      details $ pare code
    if (:failed details)
      println details
      eval-lines project (:value details)
    recur project

-- "|reusing code from https://github.com/Cirru/sepal-repl.clj"

defn sepal-repl (project & args)
  println "|Starting REPL for Sepal.clj ..."
  flush
  eval-print project
