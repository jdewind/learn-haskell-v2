module Main where
  import Data.Char
  import Control.Monad

  palindrome :: String -> Bool
  palindrome "" = False
  palindrome xs = lowered == reverse lowered
    where lowered = map toLower xs
  
  respondToPalindrome :: String -> String
  respondToPalindrome xs = if palindrome xs then xs ++ " is a palindrome" else xs ++ " is not a palindrome"

  main :: IO ()
  main = forever $ do 
    putStrLn "Give me some input "
    word <- getLine
    putStrLn $ respondToPalindrome word
