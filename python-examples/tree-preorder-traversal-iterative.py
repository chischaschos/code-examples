"""
Node is defined as
self.left (the left child of the node)
self.right (the right child of the node)
self.data (the value of the node)
"""
def preOrder(root):
    if root is None:
        return

    visited = dict()
    nodes = [root]

    while len(nodes) > 0:
        cn = nodes.pop()
        visited[cn.data] = True
        print(cn.data, end = ' ')

        if cn.right is not None:
            nodes.append(cn.right)
        if cn.left is not None:
            nodes.append(cn.left)


