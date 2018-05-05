data Anchor = A String String

compileAnchor (A url label) = label

anchor = A "http://www.yahoo.co.jp" "Yahoo"

main = do
  print $ compileAnchor anchor
