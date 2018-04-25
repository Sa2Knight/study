import System.Environment
import Data.List

main = do
  args <- getArgs
  cs <- getContents
  putStr $ fgrep (head args) cs

fgrep pattern = unlines . filter (match pattern) . lines

match pattern = any (pattern `isPrefixOf`) . tails
