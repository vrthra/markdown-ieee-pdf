-- strongify.hs
-- compile as 'ghc --make strongify.hs'
-- pandoc -t -S json myexample.md | ./strongify | pandoc -f json -t latex

import Text.Pandoc



main = toJsonFilter makeItStrong

makeItStrong (Strong xs) = [latex "\\strong{"] ++ xs ++ [latex "}"]
  where latex = RawInline "latex"
makeItStrong x           = [x]

{-main = toJsonFilter makeItStrong

makeItStrong (Strong xs) = [latex "\\strong{"] ++ xs ++ [latex "}"]
  where latex = RawInline "latex"
makeItStrong x           = [x]
-}

{-
import Text.Pandoc

makeItStrong :: [Inline] -> [Inline]
makeItStrong ((Strong x):xs) = RawInline "latex" "\\strong{" : x ++ [RawInline "latex" "}"] ++
                               makeItStrong xs
makeItStrong ( x        :xs) = x : makeItStrong xs
makeItStrong []              = []

main = interact $ jsonFilter (bottomUp makeItStrong)

-}
