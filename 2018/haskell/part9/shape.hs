data Shape = Rect Double Double

area :: Shape -> Double
area (Rect x y) = x * y

main = do
  print $ area (Rect 2 3)
