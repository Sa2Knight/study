fact 0 = 1
fact n = n * fact (n - 1)

main = do
  print [1,2,3,4,5]
  print [fact 1, fact 2, fact 3, fact 4, fact 5]
  print [fact x | x <- [1..5]]
  print [fact x | x <- [1..100], x < 3]
