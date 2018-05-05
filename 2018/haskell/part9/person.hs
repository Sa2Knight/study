data Person = Person {
  name :: String,
  age :: Int
}

taro = Person {
  name = "Taro",
  age = 25
}

main = do
  print $ name taro
  print $ age taro
