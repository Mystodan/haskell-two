module Lib
    ( getName,
    countWords,
    countOcc,
    genRandNum,
    compareNum) where

import System.Random (mkStdGen, Random (randomR), StdGen)
import Data.Time.Clock (getCurrentTime, utctDayTime)

getName :: String -> String
getName name = "Hello " ++ name

countWords :: String -> Int
countWords input = sum $ map (length . words) (lines input)

countOcc :: Eq a => a -> [a] -> Int
countOcc want [] = 0
countOcc want list = sum $
 map(const 1) $
 filter (==want) list

genRandNum:: Int -> (Int,System.Random.StdGen) 
genRandNum seed = randomR (0::Int,100::Int) $ mkStdGen seed

compareNum :: Int -> IO ()
compareNum want = do
  putStrLn "Please guess a number between 1 and 100"
  inn <- getLine
  let readString = read inn ::Int
  if readString < want then do
    putStrLn "Too small..."
    compareNum want
  else if readString > want then do 
    putStrLn "Too much..." 
    compareNum want
  else do
    putStrLn "You Won! You guessed the number, congratulations!"

