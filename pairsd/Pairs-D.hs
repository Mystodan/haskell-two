module Main where

import Lib

main :: IO ()
main = do
  putStrLn "What is your name?"
  name <- getLine 
  let statement = getName name 
  putStrLn statement
