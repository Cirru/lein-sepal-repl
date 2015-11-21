(defproject cirru/lein-sepal-repl "0.0.1"
  :description "lein plugin for Sepal.clj REPL"
  :url "http://github.com/Cirru/lein-sepal-repl"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :eval-in-leiningen true
  :dependencies [[cirru/sepal "0.0.6"]
                 [cirru/parser-combinator "0.0.1"]
                 [clojure-term-colors "0.1.0-SNAPSHOT"]
                 [fipp "0.6.3"]]
  :plugins [[cirru/lein-sepal "0.0.11"]]
  :cirru-sepal {:paths ["cirru-src"]})
