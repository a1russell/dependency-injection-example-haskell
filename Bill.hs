module Bill where

import Tax

data Prices = Prices
  { tax' :: Double -> Double
  , prices' :: [Double]
  }

bill :: Prices -> Double
bill prices =
  let
    tax'' = tax' prices
    prices'' = prices' prices
    pricesSum = sum prices''
    taxOfPrices = tax'' pricesSum
  in
    pricesSum + taxOfPrices
