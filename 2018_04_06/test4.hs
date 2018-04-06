main = do
  print [(x, y, z)
          | x <- [1..20], y <- [1..20], z <- [1..20],
            x * x + y * y == z * z
        ]
