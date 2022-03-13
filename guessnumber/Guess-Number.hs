module Main where

import Lib (genRandNum )
import Data.Time ( getCurrentTime, UTCTime(utctDayTime) )
import System.IO ( stdout, hFlush )

compareNum :: Int -> Int ->  Int ->  IO ()
compareNum min max want = do
  putStrLn ("Please guess a number between "++ show min ++" and "++show max)
  hFlush stdout
  inn <- getLine
  let readString = read inn ::Int
  if readString < want then do
    putStrLn "Too small..."
    hFlush stdout
    compareNum min max want
  else if readString > want then do
    putStrLn "Too much..."
    hFlush stdout
    compareNum min max want
  else do
    putStrLn "You Won! You guessed the number, congratulations!"
    hFlush stdout

main :: IO ()
main = do
  currTime<- getCurrentTime
  let (min, max, seed) = (1::Int,100::Int, floor $ utctDayTime currTime ::Int)
  compareNum min max $ genRandNum min max seed
