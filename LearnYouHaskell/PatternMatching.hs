addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)  
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)  

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | weight / height ^ 2 <= 18.5 = "You're underweight per the BMI calculation"  
    | weight / height ^ 2 <= 25.0 = "You're normal per BMI calcluation"  
    | weight / height ^ 2 <= 30.0 = "You're overweight per BMI calculation"  
    | otherwise                 = "You're above 30 per BMI calculation"  
