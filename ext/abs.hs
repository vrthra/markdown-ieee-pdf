module Main where
import Text.Pandoc
import System.Environment (getArgs)

extractAbs :: Pandoc -> String
extractAbs (Pandoc _ bl) = concatMap f bl
  where f (CodeBlock (_,classes,_) s) | "abstract" `elem` classes = s ++ "\n"
        f _ = []

processFile :: String -> String
processFile = extractAbs . readMarkdown defaultParserState

main :: IO ()
main = getArgs >>= mapM readFile >>= mapM_ (putStrLn . processFile)
