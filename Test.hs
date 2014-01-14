import Test.HUnit

import Bill
import Tax

billTests =
    [ "calculates bill of 0 when no prices given" ~:
      let
        prices = Prices $ const 0
        bill' = bill . prices
      in do
        0 @=? bill' []
    , "calculates bill of $11 when given two prices of $5 each" ~:
      let
        prices = Prices $ const 1
        bill' = bill . prices
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
