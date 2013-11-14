module Bill where

bill :: (GetTax a) => a -> [Double] -> Double
bill tax prices = (sum prices) + (getTax tax)

class GetTax a where
    getTax :: a -> Double

data Tax = Tax { tax :: Double }

instance GetTax Tax where
    getTax _ = 0
