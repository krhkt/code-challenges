# https://leetcode.com/problems/minimum-depth-of-binary-tree/

from typing import List


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

    @staticmethod
    def createTree(values: List[int]=None):
        valuesLength = len(values)

        if valuesLength == 0 or values is None:
            return None

        nodes = []
        for i in range(0, valuesLength):
            nodes.append(TreeNode(values[i]) if values[i] is not None else None)

        leftI = 1
        rightI = 2
        for i in range(0, valuesLength):
            node = nodes[i]
            if node is not None:
                if leftI < valuesLength:
                    node.left = nodes[leftI]
                if rightI < valuesLength:
                    node.right = nodes[rightI]
                leftI = rightI + 1
                rightI = leftI + 1

        return nodes[0]

    def toString(self):
        print(self.val, end='')
        print('(l: ', end='')
        self.left.toString() if self.left is not None else print('-', end='')
        print(')', end='')
        print('[r: ', end='')
        self.right.toString() if self.right is not None else print('-', end='')
        print(']', end='')


class Solution:
    def minDepth(self, root: TreeNode) -> int:
        if root is None:
            return 0

        if root.left is None and root.right is None:
            return 1

        leftHeight = self.minDepth(root.left) + 1
        rightHeight = self.minDepth(root.right) + 1

        if root.left is None:
            return rightHeight

        if root.right is None:
            return leftHeight

        return leftHeight if leftHeight < rightHeight else rightHeight

# TEST AREA
l = [2,None,3,None,4,None,5,None,6]
tree = TreeNode.createTree(l)

s = Solution()
print(s.minDepth(tree))

# tree2 = TreeNode(2, None, TreeNode(3, None, TreeNode(4, None, TreeNode(5, None, TreeNode(6)))))
# tree3 = TreeNode(2, None, TreeNode(3))
#
# tree3.toString()
