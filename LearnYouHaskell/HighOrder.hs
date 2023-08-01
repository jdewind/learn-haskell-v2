zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> b -> a -> c
flip' f x y = f y x

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs) 
	| f x = x : filter' f xs
	| otherwise = filter' f xs


map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f xs = [f a | a <- xs]

-- Quick sort explictly using recursion
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = 
	let smallerSorted = quicksort (filter (<=x) xs)
	    biggerSorted = quicksort (filter (>x) xs)
	in smallerSorted ++ [x] ++ biggerSorted

-- Re-implementation of (.)
compose' :: (a -> c) -> (b -> a) -> b -> c
compose' f1 f2 x = f1 (f2 x)

-- Simple version of point notation
max100 :: Int -> Int
max100 = max 100

-- Collatz Sequence (http://en.wikipedia.org/wiki/Collatz_conjecture)
chain :: (Integral a) => a -> [a]
chain 0 = error "Zero will recurse forever"
chain 1 = [1]
chain x
  | even x = x:chain (x `div` 2)
  | odd x = x:chain (x*3 + 1)
