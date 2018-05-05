data Person = Person {
  name :: String,
  age :: Int
}

intro :: Person -> String
intro (Person { name = n }) = "My name is " ++ n ++ "."

taro = Person "Taro" 25

main = do
  putStrLn $ intro taro
