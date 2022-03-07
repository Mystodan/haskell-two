module Main where

import Lib(
  countOcc,
  countWords)

main :: IO ()
main = do
  input <- getContents 
  putStrLn( show(countWords input) ++ " " ++ show(countOcc '\n' input)) 
