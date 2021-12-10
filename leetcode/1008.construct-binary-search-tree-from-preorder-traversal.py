# https://leetcode.com/problems/construct-binary-search-tree-from-preorder-traversal/

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
    def bstFromPreorder(self, preorder: List[int]) -> TreeNode:
        if len(preorder) == 0:
            return None

        limit = preorder[0]
        current = TreeNode(preorder[0])
        preLeft = [n for n in preorder if n < limit]
        preRight = [n for n in preorder if n > limit]

        current.left = self.bstFromPreorder(preLeft)
        current.right = self.bstFromPreorder(preRight)

        return current



#TEST AREA
s = Solution()

tree = s.bstFromPreorder([8,5,1,7,10,12])
tree.toString()