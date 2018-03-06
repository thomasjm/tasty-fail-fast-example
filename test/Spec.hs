{-# LANGUAGE CPP, ScopedTypeVariables, QuasiQuotes, OverloadedStrings, NamedFieldPuns, FlexibleContexts #-}

module Main where

import Control.Concurrent
import Control.Exception (evaluate)
import Control.Exception as E
import Control.Monad.IO.Class
import GHC.Stack
import System.IO
import qualified Test.Hspec as H
import Test.Tasty
import Test.Tasty.Hspec
import Test.Tasty.Ingredients.FailFast

main :: IO ()
main = do
  tree <- testSpec "Hspec tests" spec
  defaultMainWithIngredients (fmap failFast defaultIngredients) tree

spec = afterAll_ (putStrLn "FINISHED") $ do
  describe "Simple test" $ do
    it "should fail" $ do
      2 `shouldBe` 3
    it "should fail 2" $ do
      2 `shouldBe` 3

    it "should succeed 1" $ do
      threadDelay 1000000
      2 `shouldBe` 2
    it "should succeed 2" $ do
      threadDelay 1000000
      2 `shouldBe` 2
    it "should succeed 3" $ do
      threadDelay 1000000
      2 `shouldBe` 2
    it "should succeed 4" $ do
      2 `shouldBe` 2
