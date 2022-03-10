module Main where

import Lib ( compareNum, genRandNum )
import Data.Time ( getCurrentTime, UTCTime(utctDayTime) )

main :: IO ()
main = do
  currTime<- getCurrentTime
  let (min, max, seed) = (1::Int,100::Int, floor $ utctDayTime currTime ::Int)
  let (num,_) = genRandNum min max seed
  compareNum min max num
