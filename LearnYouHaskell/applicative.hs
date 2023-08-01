import Control.Applicative
-- Applicative Functor Style
-- <$> = infix fmap
-- <*> = Applicative infix function responsible for unpacking values and applying function to values
-- ZipList is a simple type constructor that takes a list of things and implements the Applicative type class
getZipList $ (+) <$> ZipList [2,4..20] <*> ZipList [1,3..20]
-- Non Applicative Equivalent
-- This style is limited to the zipWith functions. For instance, if we had more than 4 lists to zip
zipWith (\x y -> x + y) [2,4..20] [1,3..20]
-- For example
getZipList $ (,,,) <$> ZipList "Cat" <*> ZipList "Bat" <*> ZipList "Rat" <*> ZipList "Nat"


