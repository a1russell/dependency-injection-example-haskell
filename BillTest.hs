import Test.HUnit

import Bill

newtype StubTaxable0 = StubTaxable0 ()
instance Tax StubTaxable0 where
    tax _ = 0

newtype StubTaxable1 = StubTaxable1 ()
instance Tax StubTaxable1 where
    tax _ = 1

tests = test
    [ "calculates bill of 0 when no prices given" ~: do
        let bill' = bill $ StubTaxable0 ()
        0 @=? bill' []
    , "calculates bill of $11 when given two prices of $5 each" ~: do
        let bill' = bill $ StubTaxable1 ()
        11 @=? bill' [5, 5]
    , "calculates tax of $0 when no taxable given" ~: do
        let taxable = Taxable 0
        0 @=? tax taxable
    , "calculates tax of $1 given $10 taxable" ~: do
        let taxable = Taxable 10
        1 @=? tax taxable
    ]

main :: IO Counts
main = runTestTT tests
