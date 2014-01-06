module Tax where

newtype Taxer = Taxer { tax :: Double -> Double }

tax' :: Double -> Double
tax' = (*0.10)
