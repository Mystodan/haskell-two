module Main where

import Lib(readNumbers,countBirds)


main :: IO ()
main = do
  birbs <- getLine 
  let statement = show (countBirds (readNumbers birbs)) 
  putStrLn statement
