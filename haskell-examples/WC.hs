main = interact wordCount
--  where wordCount input = show (length (lines input)) ++ "\n"
--  where wordCount input = show (length (words input)) ++ "\n"
 where wordCount input = show ( map (\xs -> length (words xs)) (lines input)) ++ "\n"
