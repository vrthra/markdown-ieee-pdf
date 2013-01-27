-- strongify.hs
-- compile as 'ghc --make strongify.hs'
-- pandoc -t -S json myexample.md | ./strongify | pandoc -f json -t latex

import Text.Pandoc



main = toJsonFilter abstract

abstract (CodeBlock  (_,classes,_) s) | "abstract" `elem` classes = []
abstract x           = [x]

