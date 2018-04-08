-- https://qiita.com/7shi/items/145f1234f8ec2af923ef#%E7%B7%B4%E7%BF%92-3
len [] = 0
len (_:xs) = 1 + len xs

mysum [] = 0
mysum (x:xs) = x + mysum xs

mytake _ []        = []
mytake n _ | n < 1 = []
mytake n (x:xs)    = x : mytake (n - 1) xs

mydrop _ [] = []
mydrop n (x:xs) | n > 0 = mydrop (n - 1) xs
mydrop n xs = xs

myrev [] = []
myrev (x:xs) = myrev xs ++ [x]

myfact n = product [1..n]

main = do
  print $ myfact 8

