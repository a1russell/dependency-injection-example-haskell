import Test.HUnit

import Bill

tests = test
    [ "calculates bill of 0 when no prices given" ~: do
        0 @=? bill []
    ]

main :: IO Counts
main = runTestTT tests
