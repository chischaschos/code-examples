"""
Node is defined as
self.left (the left child of the node)
self.right (the right child of the node)
self.data (the value of the node)
"""

visited = dict()
def preOrder(node):
    if node is None:
        return

    visited[node.data] = True
    print(node.data, end=' ')
    preOrder(node.left)
    preOrder(node.right)

