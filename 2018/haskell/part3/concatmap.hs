double :: Char -> [Char]
double c = [c, c]

main = do
  print $ concatMap double "aiueo"
