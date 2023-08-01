module TPFun where
  data Car a b = Car {engine :: b a} deriving (Show)
 
  -- Type constructor with two values
  -- produce wants type constructor with a concrete value applied
  -- and yields a type of t where a and j are applied respectively
  -- ex. produce (Just "V8") :: Car [Char] Maybe
  class CarProducer t where
    produce :: j a -> t a j

  -- Could also be written as produce = Car
  instance CarProducer Car where
    produce x = Car x

  data Person t a b = Person {name :: b, gender :: t a} deriving (Show)

  instance Functor (Person a b) where
    fmap f (Person {name = x, gender = y}) = (Person {name = f x, gender = y})

