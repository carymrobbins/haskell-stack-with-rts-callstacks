module Lib where

import Control.Exception
import Data.Char

someFunc :: Int -> IO ()
someFunc n = do
  putStrLn "someFunc start"
  someOtherFunc (chr n)
  putStrLn "someFunc end"

someOtherFunc :: Char -> IO ()
someOtherFunc c = do
  putStrLn "someOtherFunc start"
  evaluate (somePureFunc (ord c))
  yetAnotherFunc (ord c)
  putStrLn "someOtherFunc end"

somePureFunc :: Int -> ()
somePureFunc n =
  if n == 0 then error "gotem pure" else ()

yetAnotherFunc :: Int -> IO ()
yetAnotherFunc n = evaluate $
  if n >= 0 then
    error "gotem io"
  else
    error "never will happen"
