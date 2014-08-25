import Control.Monad.Reader
import qualified System.Exit
import Test.HUnit

import qualified Bill
import qualified Tax

billTests :: [Test]
billTests =
    [ "calculates bill of 0 when no prices given" ~:
      let
        taxable = Bill.Taxable $ const 0
        bill = flip runReader taxable . Bill.bill
      in do
        0 @=? bill []
    , "calculates bill of $11 when given two prices of $5 each" ~:
      let
        taxable = Bill.Taxable $ const 1
        bill = flip runReader taxable . Bill.bill
      in do
        11 @=? bill [5, 5]
    ]

taxTests :: [Test]
taxTests =
    [ "calculates tax of $0 when no taxable given" ~: do
      0 @=? Tax.tax 0
    , "calculates tax of $1 given $10 taxable" ~: do
      1 @=? Tax.tax 10.0
    ]

main :: IO ()
main =
  let
    allTests = [ billTests
               , taxTests
               ]
    test' = test . concat $ allTests
  in do
    counts' <- runTestTT test'
    let failures' = failures counts'
    let errors' = errors counts'
    if failures' == 0 && errors' == 0
      then System.Exit.exitSuccess
      else System.Exit.exitFailure
