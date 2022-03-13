-- file Spec.hs
import Test.Hspec
import Control.Exception(evaluate)
import Test.DocTest (doctest)
import System.Random (mkStdGen, Random (randomR), StdGen)
import Data.Time.Clock (getCurrentTime, utctDayTime)
import Lib ( getName,
            countWords,
            countOcc,
            genRandNum,
            readNumbers,
            getPair,
            countBirds,
            checkNum)


main :: IO ()
main = do 
  doctest ["-isrc", "src/Lib.hs"]
  
  hspec $ do
    describe "getName" $ do
      it "greets a given person" $ do
        getName "Jason" `shouldBe` "Hello Jason"
        getName "BOB" `shouldBe` "Hello BOB"

      context "if no name given" $ do
        it "returns empty string" $ do
          getName "" `shouldBe` ""

    describe "countWords" $ do
      it "counts amount of words from string" $ do
        countWords "Jason Bourne" `shouldBe` 2
        countWords "BOB DYLAN IS OP" `shouldBe` 4

      context "if no string given" $ do
        it "returns 0" $ do
          countWords "" `shouldBe` 0
          
    describe "countOcc" $ do
      it "counts occurrances of a char from string" $ do
        countOcc 'J' "Jason, Jason Bourne" `shouldBe` 2
        countOcc 'B' "BOB DYLAN IS OP" `shouldBe` 2

      context "if no char matches" $ do
        it "returns 0" $ do
          countOcc '!' "" `shouldBe` 0


    describe "genRandNum" $ do
      it "generates a random number from seed with min and max value" $ do
        genRandNum 1 10 1 `shouldBe` 6
        genRandNum 1 100 45`shouldBe` 55

    describe "readNumbers" $ do
      it "reads a bunch of numbers from string into list" $ do
        readNumbers "1 10 1" `shouldBe` [1,10,1]
        readNumbers "1 100 45 69 420" `shouldBe` [1,100,45,69,420]
    
    describe "checkNum" $ do
      it "checks if two ints are divisible by last value" $ do
        checkNum 1 10 1 `shouldBe` True
        checkNum 1 2 5 `shouldBe` False

    describe "getPair" $ do
      it "Count pairs sum divisible by first value" $ do
        getPair (readNumbers "5 0 1 2 3 4 5 6") `shouldBe` [(0,5),(1,4),(2, 3),(4,6)]
    
      context "if nothing to read" $ do
        it "returns empty arr" $ do
          getPair (readNumbers "") `shouldBe` []

    describe "countBirds" $ do
      it "gives the most occurring number from list" $ do
        countBirds (readNumbers "1 10 1") `shouldBe` 1
        countBirds (readNumbers "1 2 5 5") `shouldBe` 5

      context "if there are multiple numbers occurring equal amounts" $ do
        it "returns the lowest value" $ do
          countBirds (readNumbers "5 4 3 2 1") `shouldBe` 1
