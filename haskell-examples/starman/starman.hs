-- https://www.schoolofhaskell.com/school/starting-with-haskell/libraries-and-frameworks/randoms
-- https://wiki.haskell.org/Tutorials/Programming_Haskell/String_IO
-- https://en.wikibooks.org/wiki/Haskell/do_notation
-- http://blog.sigfpe.com/2007/11/io-monad-for-people-who-simply-dont.html

import System.Random

getIndex :: Int -> IO Int
getIndex max = getStdRandom . randomR (0, max - 1)

file :: IO String
file = do
  c <- readFile "dictionary.txt"
  let rows = lines c
  let rowsNum = length . lines c
  return rows . !! . getIndex rowsNum

check :: String -> String -> Char -> (Bool,String)
check word display guess
  = (elem guess word, [
    if x == guess then x else y | (x, y) <- zip word display
  ])

turn :: String -> String -> Int -> IO ()
turn word display n =
  do if n==0
       then putStrLn "You lose"
       else if word==display
              then putStrLn "You win!"
              else mkguess word display n

mkguess :: String -> String -> Int -> IO ()
mkguess word display n =
  do putStrLn (display ++ "  " ++ take n (repeat '*'))
     putStr "  Enter your guess: "
     q <- getLine
     let (correct, display') = check word display (q!!0)
     let n' = if correct then n else n-1
     turn word display' n'

starman :: String -> Int -> IO ()
starman word n = turn word ['-' | x <- word] n

main = do
  word <- file
  starman word 5
