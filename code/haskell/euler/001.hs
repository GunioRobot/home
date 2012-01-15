-----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------- Project Euler problem 1 -----------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------
------ If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23. ------
------ Find the sum of all the multiples of 3 or 5 below 1000.                                                                           ------
-----------------------------------------------------------------------------------------------------------------------------------------------

module Main where

import Euler

-- Sum the multiples of 3 or 5 from 0 to 1000
euler001 = sum [x | x <- (filterUpper (\a -> a < 1000) nats), hasAnyFactors x [3, 5]]