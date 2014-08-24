import Control.Monad.Reader

import qualified Bill
import qualified Tax

main :: IO ()
main =
  let
    taxable = Bill.Taxable $ Tax.tax
    bill = flip runReader taxable . Bill.bill
  in do
    putStrLn . show . bill $ [10.0]
