mymap :: (a -> b) -> [a] -> [b]
mymap f [] = []
mymap f (x:xs) = f x : map f xs

double :: Integer -> Integer
double n = n * 2

main = do
  print $ mymap double [1,2,3]
