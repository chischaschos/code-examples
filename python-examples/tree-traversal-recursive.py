"""
Node is defined as
self.left (the left child of the node)
self.right (the right child of the node)
self.data (the value of the node)
"""


def preOrder(node):
    if node is None:
        return
    print(node.data, end=' ')
    preOrder(node.left)
    preOrder(node.right)


def inOrder(node):
    if node is None:
        return
    preOrder(node.left)
    print(node.data, end=' ')
    preOrder(node.right)


def postOrder(node):
    if node is None:
        return
    preOrder(node.left)
    preOrder(node.right)
    print(node.data, end=' ')
