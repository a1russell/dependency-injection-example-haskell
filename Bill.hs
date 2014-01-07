module Bill where

import Tax

bill :: [Double] -> Double
bill = bill' $ Taxer tax'

bill' :: Taxer -> [Double] -> Double
bill' taxer' prices = pricesSum + (tax taxer' pricesSum)
  where pricesSum = sum prices
