foldWidth = 10

main = do
  cs <- getContents
  putStr $ fold cs

fold cs = unlines $ concatMap flodLine $ lines cs

flodLine line = case splitAt foldWidth line of
                  (s, []) -> [s]
                  (s, cont) -> s : flodLine cont


