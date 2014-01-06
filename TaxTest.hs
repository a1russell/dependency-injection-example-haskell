import Test.HUnit

import Tax

tests = test
    [ "calculates tax of $0 when no taxable given" ~: do
        0 @=? tax' 0
    , "calculates tax of $1 given $10 taxable" ~: do
        1 @=? tax' 10.0
    ]

main :: IO Counts
main = runTestTT tests
