module Main where

import System.IO ( stdout, hFlush )

getGuessHack:: String -> Int -> IO ()
getGuessHack inn prev = do
  if inn == "Too much..." then do
    print $ prev-1
    hFlush stdout
    inn <- getLine
    getGuessHack inn $ prev-1
  else if inn == "Too small..." then do
    print $ prev+1
    hFlush stdout
    inn <- getLine
    getGuessHack inn $ prev+1
  else if inn == "Please guess a number between 1 and 100" then do
    inn <- getLine
    getGuessHack inn prev
  else if inn == "You Won! You guessed the number, congratulations!" then do
    putStrLn "Done"
  else do
    putStrLn $ "ERR - GOT INVALID STRING: ->["++inn++"]"


main :: IO ()
main = do
  print 50
  hFlush stdout
  inn <- getLine
  getGuessHack inn 50