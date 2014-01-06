import Test.HUnit

import Bill
import Tax

tests = test
    [ "calculates bill of 0 when no prices given" ~: do
        let bill = bill' $ Taxer $ const 0
        0 @=? bill []
    , "calculates bill of $11 when given two prices of $5 each" ~: do
        let bill = bill' $ Taxer $ const 1
        11 @=? bill [5, 5]
    ]

main :: IO Counts
main = runTestTT tests
