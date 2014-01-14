module Bill where

import Control.Monad.Reader

import Tax

newtype Taxable = Taxable { tax' :: Double -> Double }

bill :: [Double] -> Reader Taxable Double
bill prices =
  let
    totalPrice = sum prices
  in do
    tax'' <- asks tax'
    let taxOfPrices = tax'' totalPrice
    return $ totalPrice + taxOfPrices
