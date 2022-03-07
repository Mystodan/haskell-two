module Main where

import Lib ( compareNum, genRandNum )
import Data.Time ( getCurrentTime, UTCTime(utctDayTime) )

main :: IO ()
main = do
  currTime<- getCurrentTime
  input <- getContents 
  let seed = floor $ utctDayTime currTime ::Int
  let (num,_) = genRandNum seed
  compareNum num
