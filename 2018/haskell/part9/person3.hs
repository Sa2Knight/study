data Person = Person{
  name :: String,
  age :: Int
}

inc :: Person -> Person
inc person = person { age = age person + 1 }

taro = Person "Taro" 25

main = do
  print $ age $ inc taro
