module Lib
    ( getName,
    countWords,
    countOcc
    ) where

getName :: String -> String
getName name = "Hello " ++ name

countWords :: String -> Int
countWords input = sum $ map (length . words) (lines input)

countOcc :: Eq a => a -> [a] -> Int
countOcc want [] = 0
countOcc want list = sum $
 map(const 1) $
 filter (==want) list