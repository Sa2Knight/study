zipLineNumber :: [String] -> [(Int, String)]
zipLineNumber = zip [1..]

main = do
  cs <- getContents
  print $ zipLineNumber $ lines cs
