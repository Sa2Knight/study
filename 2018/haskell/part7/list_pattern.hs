func [] = error "error!!"
func [x] = x
func [x, _] = x
func (_:xs) = func xs

main = do
  print $ func [1, 2, 3, 4, 5]
