import Prelude hiding (length)  -- 標準関数の length を隠すおまじない

data List a = Nil
          |   Cons a (List a)

length :: List a -> Int
length Nil = 0
length (Cons x xs) = 1 + length xs

main = do
  print $ length Nil
  print $ length $ Cons 1 (Cons 2 (Cons 3 Nil))
