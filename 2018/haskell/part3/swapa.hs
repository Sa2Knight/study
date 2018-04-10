replace :: Char -> Char
replace 'a' = 'A'
replace 'A' = 'a'
replace c   = c

swapa cs = map replace cs

main = do
  cs <- getContents
  putStr $ swapa cs
