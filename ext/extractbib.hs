module Main where
import Text.Pandoc
import System.Environment (getArgs)

extractBib :: Pandoc -> String
extractBib (Pandoc _ bl) = concatMap f bl
  where f (CodeBlock (_,classes,_) s) | "bib" `elem` classes = s ++ "\n"
        f _ = []

processFile :: String -> String
processFile = extractBib . readMarkdown defaultParserState

main :: IO ()
main = getArgs >>= mapM readFile >>= mapM_ (putStrLn . processFile)
