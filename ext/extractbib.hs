module Main where
import Text.Pandoc
import Text.Pandoc.Walk
import System.Environment (getArgs)
import qualified Data.Text as T
import qualified Data.Text.IO as Tio

extractBib :: Inline -> String
extractBib (Code attr str) = str ++ "\n"
extractBib _ = ""

extractBibs :: Pandoc -> String
extractBibs = query extractBib

main :: IO ()
main = do
  args <- getArgs
  v <- readFile (head args)
  x <- runIO $ do
         doc <- readMarkdown def (T.pack v)
         v <- return $ extractBibs doc
         return v
  y <- handleError x
  putStrLn y

