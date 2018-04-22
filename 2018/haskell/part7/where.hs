import Data.List

expandTab width cs = concatMap translate cs
  where
    translate '\t' = replicate width ' '
    translate c = [c]

main = do
  print $ expandTab 4 "hoge\tfuga\thoi"
