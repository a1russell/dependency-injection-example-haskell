import Test.HUnit

import Bill

newtype StubTax0 = StubTax0 ()
instance GetTax StubTax0 where
    getTax _ = 0

newtype StubTax1 = StubTax1 ()
instance GetTax StubTax1 where
    getTax _ = 1

tests = test
    [ "calculates bill of 0 when no prices given" ~: do
        let bill' = bill $ StubTax0 ()
        0 @=? bill' []
    , "calculates bill of $11 when given two prices of $5 each" ~: do
        let bill' = bill $ StubTax1 ()
        11 @=? bill' [5, 5]
    ]

main :: IO Counts
main = runTestTT tests
