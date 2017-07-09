""" Node is defined as
class node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None
"""

def check(root, min, max):
    if root == None: 
        return True
    return root.data > min and root.data < max and check(root.left, min, root.data) and check(root.right, root.data, max)
    
def checkBST(root):
    return check(root, -1, 10001)
    