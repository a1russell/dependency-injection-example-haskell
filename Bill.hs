module Bill where

import Control.Monad.Reader

import Tax

newtype Taxable = Taxable { tax' :: Double -> Double }

bill :: [Double] -> Reader Taxable Double
bill prices = ReaderT $ \taxable ->
  let
    tax'' = tax' taxable
    pricesSum = sum prices
    taxOfPrices = tax'' pricesSum
  in
    return $ pricesSum + taxOfPrices
