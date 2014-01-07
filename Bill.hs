module Bill where

import Tax

bill :: [Double] -> Double
bill = bill' Taxer

bill' :: (Tax a) => a -> [Double] -> Double
bill' taxer' prices = pricesSum + (tax taxer' pricesSum)
  where pricesSum = sum prices
