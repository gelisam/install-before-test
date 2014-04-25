import Control.Monad
import Distribution.Simple
import System.Environment

main = do
    args <- getArgs
    when ("test" `elem` args) $ do
      -- unlike most packages, Hawk needs to be installed before it can be tested.
      defaultMainArgs ["install"]
    defaultMainArgs args
