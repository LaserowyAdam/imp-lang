module Main where

import Language as L
import Parser as P
import Semantics.SmallStep
import Semantics.Store
import Semantics.BigStep


main :: IO ()
main = do
    let e = L.testExpr
    print e
    print $ trace (e , emptyStore)
    print P.testExpr
