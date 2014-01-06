import Test.HUnit

import Bill

tests = test
    [ "calculates bill of 0 when no prices given" ~: do
        let bill = bill' $ Taxer $ const 0
        0 @=? bill []
    , "calculates bill of $11 when given two prices of $5 each" ~: do
        let bill = bill' $ Taxer $ const 1
        11 @=? bill [5, 5]
    , "calculates tax of $0 when no taxable given" ~: do
        0 @=? tax' 0
    , "calculates tax of $1 given $10 taxable" ~: do
        1 @=? tax' 10.0
    ]

main :: IO Counts
main = runTestTT tests
