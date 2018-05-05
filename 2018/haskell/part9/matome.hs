data Anchor = A {
  aUrl :: String,
  aLabel :: String
}

compileAnchor :: Anchor -> String
compileAnchor (A {
  aUrl = u,
  aLabel = l
}) = "<a href=\"" ++ u ++ "\">" ++ l ++ "</a>"

anchorUrl :: Anchor -> String
anchorUrl (A { aUrl = u } ) = u

href :: Anchor
href = A "http://www.yahoo.co.jp" "Yahoo!"

main = do
  print (aLabel href)
  print $ compileAnchor href
  print $ anchorUrl href
