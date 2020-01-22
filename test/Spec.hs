import Lib

import Control.Exception

import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "someFunc" $ do
    it "should bomb" $ do
      someFunc 0

    it "should bomb differently" $ do
      someFunc 1

    it "should bomb with myCoolAssertion" $ do
      myCoolAssertion someFunc 0

    it "should bomb with myCoolerAssertion" $ do
      myCoolerAssertion someFunc

    it "should get the call stack" $ do
      RenderedString "^^ look ma, a call stack"
        `shouldBe` RenderedString (aThingWithAStack 0)

  where
  myCoolAssertion x n = do
    a <- try (x n) :: IO (Either ErrorCall ())
    a `shouldBe` Right ()

  myCoolerAssertion x = do
    myCoolAssertion x 1

newtype RenderedString = RenderedString String
  deriving (Eq)

instance Show RenderedString where
  show (RenderedString s) = s
