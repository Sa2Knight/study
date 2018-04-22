f n = let x = y + 5
          y = x + 2
      in
        x * y

main = do
  print $ f 10
