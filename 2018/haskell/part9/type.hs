type Age = Int
type Name = String
type Message = String

main = do
  let message = howOldAreYou "田村ゆかり" 17
  putStrLn message

howOldAreYou :: Name -> Age -> Message
howOldAreYou name age = nameSan ++ ageSai
  where
    nameSan = name ++ "さん"
    ageSai  = show age ++ "歳"
