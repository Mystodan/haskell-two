module Main where

import Lib(
  countOcc,
  countWords)

main :: IO ()
main = do
  input <- getContents 
  putStrLn(show(countOcc '\n' input) ++ " " ++ show(countWords input)) 
