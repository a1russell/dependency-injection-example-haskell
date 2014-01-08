import Test.HUnit

import Bill
import Tax

billTests =
    [ "calculates bill of 0 when no prices given" ~:
      let
        taxFn = TaxFn $ const 0
        tax'' = tax taxFn
        billDep = BillDep taxFn
        bill'' = bill billFn $ billDep
      in do
        0 @=? bill'' []
    , "calculates bill of $11 when given two prices of $5 each" ~:
      let
        taxFn = TaxFn $ const 1
        tax'' = tax taxFn
        billDep = BillDep taxFn
        bill'' = bill billFn $ billDep
      in do
        11 @=? bill'' [5, 5]
    ]

taxTests =
    [ "calculates tax of $0 when no taxable given" ~: do
      let tax'' = tax taxFn
      0 @=? tax'' 0
    , "calculates tax of $1 given $10 taxable" ~: do
      let tax'' = tax taxFn
      1 @=? tax'' 10.0
    ]

tests = test $ billTests ++ taxTests

main :: IO Counts
main = runTestTT tests
