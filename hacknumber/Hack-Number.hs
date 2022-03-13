module Main where

import System.IO

import Lib (getGuessHack)

main :: IO ()
main = do
  print 50
  hFlush stdout
  inn <- getLine
  getGuessHack inn 50