module Bill where

bill :: (Tax a) => a -> [Double] -> Double
bill taxable prices = (sum prices) + (tax taxable)

class Tax a where
    tax :: a -> Double

instance Tax Double where
    tax taxable = taxable * 0.10
