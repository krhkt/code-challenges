#https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/

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
    def buildTree(self, preorder: List[int], inorder: List[int]) -> TreeNode:
        if len(preorder) == 0:
            return None

        rootVal = preorder[0]
        inorderRootPos = inorder.index(rootVal)

        leftInorderSubtree = inorder[:inorderRootPos]
        rightInorderSubtree = inorder[inorderRootPos + 1:]

        leftPreorderSubtree = preorder[1:len(leftInorderSubtree) + 1]
        rightPreorderSubtree = preorder[len(leftInorderSubtree) + 1:]

        node = TreeNode(rootVal,
                        self.buildTree(leftPreorderSubtree, leftInorderSubtree),
                        self.buildTree(rightPreorderSubtree, rightInorderSubtree),
                        )

        return node

    def buildTreeV2(self, preorder: List[int], inorder: List[int]) -> TreeNode:
        if len(preorder) == 0:
            return None

        if len(preorder) == 1:
            return TreeNode(preorder[0])

        rootVal = preorder[0]
        inorderRootPos = inorder.index(rootVal)

        leftInorderSubtree = inorder[:inorderRootPos]
        rightInorderSubtree = inorder[inorderRootPos + 1:]

        leftPreorderSubtree = preorder[1:len(leftInorderSubtree) + 1]
        rightPreorderSubtree = preorder[len(leftInorderSubtree) + 1:]

        node = TreeNode(rootVal,
                        self.buildTree(leftPreorderSubtree, leftInorderSubtree),
                        self.buildTree(rightPreorderSubtree, rightInorderSubtree),
                        )

        return node


# TEST AREA
preorder = [3,9,20,15,7]
inorder = [9,3,15,20,7]
s = Solution()
s.buildTree(preorder, inorder).toString()

print('\n---')
preorderA = [1, 2, 4, 5, 3, 6, 7]
inorderA = [4, 2, 5, 1, 6, 7, 3]
s.buildTree(preorderA, inorderA).toString()

print('\n---')
preorderB = [1, 2, 3, 4, 5]
inorderB = [1, 3, 2, 5, 4]
s.buildTree(preorderB, inorderB).toString()