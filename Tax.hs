module Tax where

newtype TaxFn = TaxFn { tax :: Double -> Double }

taxFn :: TaxFn
taxFn = TaxFn tax'

tax' :: Double -> Double
tax' = (*0.10)
