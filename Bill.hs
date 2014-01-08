module Bill where

import Tax

newtype BillDep = BillDep { taxFn' :: TaxFn }

newtype BillFn = BillFn { bill :: BillDep -> [Double] -> Double }

billFn :: BillFn
billFn = BillFn bill'

bill' :: BillDep -> [Double] -> Double
bill' billDep prices =
  let
    taxFn'' = taxFn' billDep
    tax'' = tax taxFn''
    pricesSum = sum prices
    taxOfPrices = tax'' pricesSum
  in
    pricesSum + taxOfPrices
