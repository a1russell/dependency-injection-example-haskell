module Bill where

bill :: (GetTax a) => a -> [Double] -> Double
bill tax prices = (sum prices) + (getTax tax)

class GetTax a where
    getTax :: a -> Double
