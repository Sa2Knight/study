main = do
  strA <- getLine
  strB <- getLine
  let
    a = read strA :: Int
    b = read strB :: Int
    (d, m) = intDivMod a b
  putStrLn ("商は" ++ show d)
  putStrLn ("あまりは" ++ show m)

intDivMod :: Int -> Int -> (Int, Int)
intDivMod a b = (div a b, mod a b)
