data Anchor = A { aUrl :: String,
                  aLabel :: String }

compileAnchor (A { aUrl = u, aLabel = l }) = u

anchor = A "http://www.yahoo.co.jp" "Yahoo!"

main = do
  print $ compileAnchor anchor
