module Bill where

import Tax

newtype Taxable = Taxable { tax' :: Double -> Double }

bill :: Taxable -> [Double] -> Double
bill taxable prices =
  let
    tax'' = tax' taxable
    pricesSum = sum prices
    taxOfPrices = tax'' pricesSum
  in
    pricesSum + taxOfPrices
