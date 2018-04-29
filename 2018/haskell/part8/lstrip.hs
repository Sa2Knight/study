main = do
  cs <- getContents
  putStr $ unlines $ map lstrip $ lines cs

lstrip :: String -> String
lstrip = dropWhile (== ' ')
