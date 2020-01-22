module Main where

import Lib

import Control.Exception
import System.Environment

main :: IO ()
main = do
  putStrLn "RUNNING MAIN"
  n <- parseArg
  someFunc n

parseArg :: IO Int
parseArg = do
  ms <- lookupEnv "ARG"
  case ms of
    Nothing -> pure 0
    Just s -> evaluate (read s)
