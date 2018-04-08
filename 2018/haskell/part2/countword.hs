countword cs = length $ words cs

main = do
  cs <- getContents
  print $ countword cs
