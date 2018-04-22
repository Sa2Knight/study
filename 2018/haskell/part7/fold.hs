split [] = []
split xs = let ts = splitAt 10 xs
           in (fst ts) ++ "\n" ++ (split $ snd ts)

main = do
  cs <- getContents
  putStr $ concatMap split $ lines cs
