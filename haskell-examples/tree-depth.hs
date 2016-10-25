data Tree = Leaf | Node Int Tree Tree deriving Show

treeDepth :: Tree -> Int
treeDepth Leaf = 0
treeDepth (Node _ lt rt) = 1 + max (treeDepth lt) (treeDepth rt)

treeVal :: Tree -> Int
treeVal Leaf = 0
treeVal (Node v lt rt) = v + treeVal lt + treeVal rt

t = Node 10
  Leaf
  (Node 1
    Leaf
    (Node 9 Leaf Leaf))


main = do
  putStrLn(show(treeDepth t))
  putStrLn(show(treeVal t))

