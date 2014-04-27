import Control.Monad
import Distribution.Simple
import System.Environment

substitute :: Eq a => [(a, [a])] -> [a] -> [a]
substitute substitutions = (>>= go)
  where
    go x = case lookup x substitutions of
             Just xs -> xs
             Nothing -> return x

main = do
    args <- getArgs
    when ("test" `elem` args) $ do
      -- unlike most packages, this one needs to be installed before it can be tested.
      defaultMainArgs (substitute [("test", ["install"])] args)
    when ("install" `elem` args && "--enable-tests" `elem` args) $ do
      -- first, install without the tests.
      defaultMainArgs (substitute [("--enable-tests", [])] args)
    defaultMainArgs args
