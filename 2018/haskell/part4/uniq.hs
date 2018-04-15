import Data.List

main = do
  cs <- getContents
  putStr $ unlines $ map head $ group $ sort $ lines cs
