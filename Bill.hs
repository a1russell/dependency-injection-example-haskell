module Bill where

import Control.Monad.Reader

import Tax

type TaxableReader = Reader (Double -> Double)

bill :: [Double] -> TaxableReader Double
bill prices =
  let
    totalPrice = sum prices
  in do
    tax'' <- ask
    let taxOfPrices = tax'' totalPrice
    return $ totalPrice + taxOfPrices
