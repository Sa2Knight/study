f :: Int -> Int
f n = let x = n + 1
          y = n + 2
          z = n + 3
      in x + y + z

main = do
  print $ f 10
