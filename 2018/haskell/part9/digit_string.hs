newtype DigitString = DigitStr String

atoi :: DigitString -> Int
atoi (DigitStr xs) = read xs

main = do
  print $ atoi (DigitStr "0123")
