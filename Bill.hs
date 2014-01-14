module Bill where

import Control.Monad.Reader

import Tax

newtype Taxable = Taxable { tax' :: Double -> Double }

bill :: [Double] -> Reader Taxable Double
bill prices = ReaderT $ \taxable ->
  let
    totalPrice = sum prices
    tax'' = tax' taxable
    taxOfPrices = tax'' totalPrice
  in
    return $ totalPrice + taxOfPrices
