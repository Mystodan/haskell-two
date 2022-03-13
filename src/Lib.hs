module Lib
    ( getName,
    countWords,
    countOcc,
    genRandNum,
    readNumbers,
    getPair,
    countBirds,
    checkNum) where

import System.Random (mkStdGen, Random (randomR), StdGen)
import Data.Time.Clock (getCurrentTime, utctDayTime)
import Data.List ( sort, group )
import System.IO ( stdout, hFlush )

-- | getName
--
-- Examples:
--
-- >>> getName "Jason"
-- "Hello Jason"
-- >>>  getName "BOB"
-- "Hello BOB"
-- >>>  getName ""
-- ""
getName :: String -> String
getName [] = ""
getName name = "Hello " ++ name

-- | countWords
--
-- Examples:
--
-- >>> countWords "Jason Bourne" 
-- 2
-- >>>  countWords "BOB DYLAN IS OP"
-- 4
countWords :: String -> Int
countWords [] = 0
countWords input = sum $ map (length . words) (lines input)

-- | countOcc
--
-- Examples:
--
-- >>> countOcc 'J' "Jason, Jason Bourne" 
-- 2
-- >>>  countOcc 'B' "BOB DYLAN IS OP"
-- 2
-- >>>  countOcc '!' ""
-- 0
countOcc :: Eq a => a -> [a] -> Int
countOcc want [] = 0
countOcc want list = sum $
 map(const 1) $
 filter (==want) list

-- | genRandNum
--
-- Examples:
--
-- >>>  genRandNum 1 10 1 
-- 6
-- >>>  genRandNum 1 100 45
-- 55
genRandNum:: Int -> Int -> Int -> Int
genRandNum min max seed = do 
  let (retNum,_) = randomR (min,max) $ mkStdGen seed
  retNum

-- | readNumbers
--
-- Examples:
--
-- >>> readNumbers "1 2 3 4 5" 
-- [1,2,3,4,5]
-- >>>  readNumbers "5 4 3 2 1"
-- [5,4,3,2,1]
readNumbers :: String -> [Int]
readNumbers = map read . words

-- | checkNum
--
-- Examples:
--
-- >>> checkNum 1 10 1 
-- True
-- >>>  checkNum 1 2 5 
-- False
checkNum :: Int -> Int -> Int -> Bool
checkNum elem num want
 | (elem + num) `mod` want == 0 = True
 | otherwise = False

-- | getPair
--
-- Examples:
--
-- >>> getPair (readNumbers "5 0 1 2 3 4 5 6")
-- [(0,5),(1,4),(2,3),(4,6)]
-- >>>  getPair (readNumbers "")
-- []
getPair :: [Int] -> [(Int,Int)]
getPair[] = []
getPair (elem:list) = [(i,j) | i <- [0..length list-1], j <- [i+1..length list-1], checkNum (list!!i) (list!!j) elem]

-- | countBirds
--
-- Examples:
--
-- >>> countBirds (readNumbers "1 10 1")
-- 1
-- >>>  countBirds (readNumbers "1 2 5 5")
-- 5
-- >>>  countBirds (readNumbers "5 4 3 2 1")
-- 1
countBirds:: [Int] -> Int
countBirds =  abs . snd . maximum . map (\xs -> (length xs, -(head xs))) . group . sort


 