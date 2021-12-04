# https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/

from typing import List

class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

    def toString(self):
        print(self.val, end='')
        if self.left is not None:
            print('(l: ', end='')
            self.left.toString()
            print(')', end='')
        if self.right is not None:
            print('[r: ', end='')
            self.right.toString()
            print(']', end='')


class Solution:
    def buildTree(self, inorder: List[int], postorder: List[int]) -> TreeNode:
        if postorder is None or len(postorder) == 0:
            return None

        rootValue = postorder[-1]
        node = TreeNode(rootValue)

        i = 0
        while inorder[i] != rootValue:
            i += 1

        inorderLeft = inorder[:i]
        inorderRight = inorder[i+1:]

        postorderLeft = postorder[:i]
        postorderRight = postorder[i:-1]

        node.left = self.buildTree(inorderLeft, postorderLeft)
        node.right = self.buildTree(inorderRight, postorderRight)

        return node


# TEST AREA
s = Solution()
tree = s.buildTree([9,3,15,20,7], [9,15,7,20,3])
tree.toString()