import Control.Monad.Writer
import BinaryTree

treeElemLog :: (Ord a, Show a) => a -> Tree a -> Writer [String] Int
treeElemLog x EmptyTree = do
  tell ["Element " ++ show x ++ " doesn't exist in tree"]
  return 0
treeElemLog x (Node a left right)
  | x == a = do
    tell ["Element " ++ show x ++ " found!"]
    return 0
  | x < a = do
    depth <- treeElemLog x left
    tell ["Searching left node at depth " ++ show depth]
    return $ depth + 1
  | x > a = do
    depth <- treeElemLog x right
    tell ["Searching right node at depth " ++ show depth]
    return $ depth + 1

main :: IO ()
main = forever $ do 
  let btree = foldr treeInsert EmptyTree [10, 28, 12, 481, 37, 38129, 394, 18, 23, 94, 198]
  putStrLn "Enter number:"
  num <- getLine
  mapM_ putStrLn $ reverse $ snd $ runWriter $ treeElemLog (read num) btree
