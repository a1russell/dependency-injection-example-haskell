module Bill where

newtype Taxer = Taxer { tax :: Double -> Double }

bill = bill' $ Taxer tax'

bill' :: Taxer -> [Double] -> Double
bill' taxer prices = pricesSum + (tax taxer pricesSum)
  where pricesSum = sum prices

tax' :: Double -> Double
tax' = (*0.10)
