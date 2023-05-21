module Parsertest where

import Test.HUnit 
import Test.HUnit.Base (Test (TestCase))
import Parser 
import Test.QuickCheck
import Data.Either (Either(Right))


tests :: Test
tests = TestList
    [ TestCase $ assertEqual "Test 1" (show <$>( parseExpr someExprParser "(While (x <= 2) Do (If (x <= y) Then Skip Else Skip))")) (Right "(While (x <= 2) Do (If (x <= y) Then Skip Else Skip))")
    , TestCase $ assertEqual "Test 2" (show <$> parseExpr someExprParser "((y := 0) ; ((x := 5) ; (While (1 <= x) Do ((If (x <= 3) Then (y:=(y+1)) Else Skip);(x:=(x+1))))))" ) (Right "((y := 0); ((x := 5); (While (1 <= x) Do ((If (x <= 3) Then (y := (y + 1)) Else Skip); (x := (x + 1))))))")
    , TestCase $ assertEqual "Test Bool 1" (show <$> parseExpr someExprParser "T") (Right "T")
    , TestCase $ assertEqual "Test Bool 2" (show <$> parseExpr someExprParser "F") (Right "F")
    , TestCase $ assertEqual "Test Bool 3" (show <$> parseExpr someExprParser "(4 <= x)") (Right "(4 <= x)")
    , TestCase $ assertEqual "Test Var" (show <$> parseExpr someExprParser "x") (Right "x")
    , TestCase $ assertEqual "Test Const" (show <$> parseExpr someExprParser "123") (Right "123")
    , TestCase $ assertEqual "Test Skip" (show <$> parseExpr someExprParser "Skip") (Right "Skip")
    , TestCase $ assertEqual "Test Assign" (show <$> parseExpr someExprParser "(x := 1)") (Right "(x := 1)")
    , TestCase $ assertEqual "Test AndThen" (show <$> parseExpr someExprParser "(Skip ; Skip)") (Right "(Skip; Skip)")
    , TestCase $ assertEqual "Test Op 1" (show <$> parseExpr someExprParser "(x + y)") (Right "(x + y)")
    , TestCase $ assertEqual "Test Op 2" (show <$> parseExpr someExprParser "(x * y)") (Right "(x * y)")
    , TestCase $ assertEqual "Test IfElse" (show <$> parseExpr someExprParser "(If T Then Skip Else Skip)") (Right "(If T Then Skip Else Skip)")
    , TestCase $ assertEqual "Test While" (show <$> parseExpr someExprParser "(While T Do Skip)") (Right "(While T Do Skip)")
    ]




