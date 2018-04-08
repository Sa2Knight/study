takeLast n ss = reverse $ take n $ reverse ss

lastNLines n cs = unlines $ takeLast n $ lines cs

main = do cs <- getContents
          putStr $ lastNLines 3 cs
