module Triangle
( Triangle
, rightTriangle
, perimeterMultipleOf
, generateTriangles
) where
  data Triangle a = Triangle a a a deriving (Show)

  rightTriangle :: (Num a) => (Eq a) => Triangle a -> Bool
  rightTriangle (Triangle a b c) = a^2 + b^2 == c^2

  perimeterMultipleOf :: (Num a) => (Integral a) => a -> Triangle a -> Bool
  perimeterMultipleOf m (Triangle a b c) = mod (a + b + c)  m == 0

  generateTriangles :: Int -> [Triangle Int]
  generateTriangles num = [ Triangle a b c | c <- [1..num], b <- [1..num], a <- [1..num] ]

