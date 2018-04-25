firstNLines n = unlines . take n . lines

main = do
  cs <- getContents
  putStr $ firstNLines 5 cs
