import Test.HUnit

import Bill
import Tax

data StubTaxer0 = StubTaxer0
instance Tax StubTaxer0 where
    tax _ = const 0

data StubTaxer1 = StubTaxer1
instance Tax StubTaxer1 where
    tax _ = const 1

billTests =
    [ "calculates bill of 0 when no prices given" ~: do
        let bill = bill' StubTaxer0
        0 @=? bill []
    , "calculates bill of $11 when given two prices of $5 each" ~: do
        let bill = bill' StubTaxer1
        11 @=? bill [5, 5]
    ]

taxTests =
    [ "calculates tax of $0 when no taxable given" ~: do
        0 @=? tax' 0
    , "calculates tax of $1 given $10 taxable" ~: do
        1 @=? tax' 10.0
    ]

tests = test $ billTests ++ taxTests

main :: IO Counts
main = runTestTT tests
