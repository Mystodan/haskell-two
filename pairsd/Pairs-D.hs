module Main where
import Lib ( getPair, readNumbers )

main :: IO ()
main = do
  list <- getLine
  let (returnList, listSize) =  (getPair (readNumbers list), length returnList)
  putStrLn (show listSize ++ "\n" ++ show returnList)
