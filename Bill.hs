module Bill where

bill :: (Tax a) => a -> [Double] -> Double
bill taxable prices = (sum prices) + (tax taxable)

class Tax a where
    tax :: a -> Double

data Taxable = Taxable { taxable :: Double }

instance Tax Taxable where
    tax _ = 0
