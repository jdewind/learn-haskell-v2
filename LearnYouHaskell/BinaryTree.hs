module BinaryTree
( singleton
, treeInsert
, treeElem
, rightMost
, leftMost
, Tree(EmptyTree, Node)
, nodeDepth
)
where

import Control.Applicative
import qualified Data.Foldable as F
import Data.Monoid

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Eq)

instance (Ord a, Show a) => Show (Tree a) where
  show (Node a left right) = " " ++ show a ++ " [ " ++ show left ++ show right ++ " ] "
  show EmptyTree = "*"

singleton :: a -> Tree a
singleton a = Node a EmptyTree EmptyTree

-- Example: Binary Tree, Unbalanced
-- Left Element < Node
-- Right Element > Node
--          10
--        /   \
--       6     12
--     /  \   /  \
--    5    8 *   18
--  /  \
-- 2    *
-- Example:
-- let btree = foldr treeInsert EmptyTree [18, 2, 12, 8, 5, 6, 10]
--
treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
  | x == a = Node x left right
  | x < a = Node a (treeInsert x left) right
  | x > a = Node a left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem _ EmptyTree = False
treeElem x (Node a left right)
  | x == a = True
  | x < a = treeElem x left
  | x > a = treeElem x right


leftMost :: (Ord a) => Tree a -> a
leftMost (Node a EmptyTree _) = a
leftMost (Node _ left _) = leftMost left 

rightMost :: (Ord a) => Tree a -> a
rightMost (Node a _ EmptyTree) = a
rightMost (Node a _ right) = rightMost right

nodeDepth :: (Ord a) => a -> Tree a -> Int
nodeDepth _ EmptyTree = 0
nodeDepth x (Node a left right)
  | x == a = 0
  | x < a = 1 + (nodeDepth x left)
  | x > a = 1 + (nodeDepth x right)

-- Functor take type constructor
-- Map takes function (a -> b)
-- where a is applied to it and returns b
--
instance Functor Tree where
  fmap f EmptyTree = EmptyTree
  fmap f (Node x left right) = Node (f x) (fmap f left) (fmap f right)

instance F.Foldable Tree where  
    foldMap f EmptyTree = mempty  
    foldMap f (Node x l r) = mappend (F.foldMap f l) $ mappend (f x) (F.foldMap f r) 
