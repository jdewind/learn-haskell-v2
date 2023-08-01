module Main where
  import System.Environment
  import Triangle

  printResults :: [String] -> IO () 
  printResults [num, per] = print $ filter (\x -> rightTriangle x && perimeterMultipleOf (read per) x) $ generateTriangles $ read num
  printResults args = putStrLn "Wrong number of arguments"

  main :: IO ()
  main = do 
    args <- getArgs
    printResults args
