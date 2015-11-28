
ns leiningen.sepal-repl
  :require
    [] leiningen.core.eval :as eval
    [] leiningen.core.classpath :as cp
    [] cirru.sepal :refer $ [] transform-x
    [] cirru.parser-combinator :refer $ [] pare
    [] clojure.term.colors :refer :all
    [] clojure.pprint :as pp
    [] fipp.edn :refer
      [] pprint
      , :rename $ {} (pprint fipp)
    [] cemerick.pomegranate :as pomegranate

def open-paren "|("

defn- eval-code (quoted-code)
  let
      _ $ println $ magenta
        str "|    -> "
          with-out-str $ pp/write quoted-code
      result $ try
        eval quoted-code
        catch Exception e
          println e
    print $ blue "|    <- "
    fipp result

defn- eval-print ()
  print $ blue "|sepal> "
  flush
  let
      code $ read-line
    if (= code nil)
      do
        println "|\nbye for now~"
        System/exit 0
      if (= (subs code 0 1) open-paren)
        eval-code $ read-string code
        let
            details $ pare code
          if (:failed details)
            println details
            eval-code $ transform-x $ get (:value details) 0
    recur

-- "|reusing code from https://github.com/Cirru/sepal-repl.clj"

defn sepal-repl (project & args)
  println "|Starting REPL for Sepal.clj ..."
  flush
  doseq
    [] path $ cp/get-classpath project
    pomegranate/add-classpath path
  eval-print
