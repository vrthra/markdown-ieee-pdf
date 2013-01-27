-- strongify.hs
-- compile as 'ghc --make strongify.hs'
-- pandoc -t -S json myexample.md | ./strongify | pandoc -f json -t latex

import Text.Pandoc

import Text.Pandoc

makeItStrong :: [Block] -> [Block]
makeItStrong ((Header y x):xs)
  | y == 3 = [RawBlock "latex" ("\\subsubsection*{" ++ (concatMap fn x) ++ "}")] ++ makeItStrong xs
  where fn (Str x) = x
        fn z = (show z)
  -- | otherwise = ((Header y x):xs)
makeItStrong (x :xs) = x : makeItStrong xs
makeItStrong [] = []

main = interact $ jsonFilter (bottomUp makeItStrong)
