module Bill where

import Tax

bill :: (Double -> Double) -> [Double] -> Double
bill tax' prices =
  let
    pricesSum = sum prices
    taxOfPrices = tax' pricesSum
  in
    pricesSum + taxOfPrices
