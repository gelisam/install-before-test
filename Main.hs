import Data.List
import System.Exit
import System.Process


main :: IO ()
main = do
    out <- readProcess "cabal" ["info", "hello"] ""
    if "Versions installed: 0.1.0.0" `isInfixOf` out
      then exitSuccess
      else exitFailure
