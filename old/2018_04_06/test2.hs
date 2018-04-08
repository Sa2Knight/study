import Data.Char

port13number n | n <= 77 = n + 13
port13number n           = n - 13

port13char c = chr $ port13number $ ord c

port13 ""     = ""
port13 (x:xs) = port13char x : port13 xs

main = do
  print $ port13 "HELLO"
