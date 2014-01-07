module Tax where

data Taxer = Taxer

class Tax a where
    tax :: a -> Double -> Double

instance Tax Taxer where
    tax _ = tax'

tax' :: Double -> Double
tax' = (*0.10)
