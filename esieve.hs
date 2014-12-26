-- The Sieve of Erathosthenes
-- http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes

-- This sieve is an efficient way to find all primes up to about 
-- 10 million or so, named after Eratosthenes of Cyrene, a Greek mathematician.

import System.Environment

-- (esieve x) returns a list of all primes below x
esieve :: [Int]
esieve = esievefrom [2..]

-- divisible
divisible :: Int -> Int -> Bool
divisible x y = rem y x == 0

esievefrom :: [Int] -> [Int]
esievefrom (x:xs) = x:esievefrom (filter (not . (divisible x)) xs)

printHelp = do
    name <- getProgName
    putStrLn $ "Usage: " ++ name ++ " <num>"
    putStrLn ""
    putStrLn "Prints out the first <num> prime numbers."
    putStrLn ""
    putStrLn "Uses the Sieve of Eratosthenes to locate numbers, which"
    putStrLn "is very efficient up to the first 10 million or so primes."

main = do
    args <- getArgs
    if (length args) == 1
        then mapM_ (putStrLn . show) $ take (read (head args) :: Int) esieve
        else printHelp
