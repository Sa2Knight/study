countbyte cs = length cs

main = do
  cs <- getContents
  print $ countbyte cs
