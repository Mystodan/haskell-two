module Lib
    ( getName,
    countWords,
    countOcc,
    genRandNum,
    compareNum,
    readNumbers,
    it,
    getPair,
    countBirds,
    checkNum) where

import System.Random (mkStdGen, Random (randomR), StdGen)
import Data.Time.Clock (getCurrentTime, utctDayTime)
import Data.Function
import Data.List

getName :: String -> String
getName name = "Hello " ++ name

countWords :: String -> Int
countWords input = sum $ map (length . words) (lines input)

countOcc :: Eq a => a -> [a] -> Int
countOcc want [] = 0
countOcc want list = sum $
 map(const 1) $
 filter (==want) list

genRandNum:: Int -> Int -> Int -> (Int,System.Random.StdGen)
genRandNum min max seed = randomR (min,max) $ mkStdGen seed

compareNum :: Int -> Int ->  Int ->  IO ()
compareNum min max want = do
  putStrLn ("Please guess a number between "++ show min ++" and "++show max)
  inn <- getLine
  let readString = read inn ::Int
  if readString < want then do
    putStrLn "Too small..."
    compareNum min max want
  else if readString > want then do
    putStrLn "Too much..."
    compareNum min max want
  else do
    putStrLn "You Won! You guessed the number, congratulations!"

it :: [Int] -> Int -> Int
it list it = list!!it

readNumbers :: String -> [Int]
readNumbers = map read . words

checkNum :: Int -> Int -> Int -> Bool
checkNum elem num want
 | (elem + num) `mod` want == 0 = True
 | otherwise = False

getPair :: [Int] -> [(Int,Int)]
getPair[] = []
getPair (elem:list) = [(i,j) | i <- [0..length list-1], j <- [i+1..length list-1], checkNum (it list i) (it list j) elem]

countBirds:: [Int] -> Int 
countBirds = head . maximumBy (on compare length) . group . sort