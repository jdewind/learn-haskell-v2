module FunctorMap where
  import qualified Data.Map as Map
 
  -- Defining own functor class
  -- Operates on a type constructor
  class MyFunctor f where
    mfmap :: (a -> b) -> f a -> f b

  -- Implementing functor on Map
  -- Point free style. Same as mfmap f x = Map.map f x
  -- Notice that type constructor is partially applied
  instance MyFunctor (Map.Map k) where
    mfmap = Map.map

