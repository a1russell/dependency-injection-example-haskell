import Control.Monad.Reader
import Test.HUnit

import Bill
import Tax

billTests =
    [ "calculates bill of 0 when no prices given" ~:
      let
        taxable = Taxable $ const 0
        bill' = flip runReader taxable . bill
      in do
        0 @=? bill' []
    , "calculates bill of $11 when given two prices of $5 each" ~:
      let
        taxable = Taxable $ const 1
        bill' = flip runReader taxable . bill
      in do
        11 @=? bill' [5, 5]
    ]

taxTests =
    [ "calculates tax of $0 when no taxable given" ~: do
      0 @=? tax 0
    , "calculates tax of $1 given $10 taxable" ~: do
      1 @=? tax 10.0
    ]

tests = test $ billTests ++ taxTests

main :: IO Counts
main = runTestTT tests
