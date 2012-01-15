-----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------- Project Euler problem 2 -----------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------
------ Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10     ------
------ terms will be:                                                                                                                    ------
------ 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...                                                                                            ------
------ By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued       ------
------ terms.                                                                                                                            ------
-----------------------------------------------------------------------------------------------------------------------------------------------

module Main where

-- Generate an infinite list of fibonacci numbers
fib :: [Int]
fib = [0, 1] ++ fib' 0 1
    where fib' a b = [a + b] ++ fib' b (a + b)

-- Filter a sorted list by some upper bound
filterupper :: (a -> Bool) -> [a] -> [a]
filterupper f []     = []
filterupper f (a:as) | f a       = [a] ++ filterupper f as
                     | otherwise = []

-- Find the sum of the even fibonacci numbers <= 4,000,000
euler002 :: Int
euler002 = sum [x | x <- (filterupper (\a -> a <= 4000000) fib), mod x 2 == 0]
