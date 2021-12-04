# https://leetcode.com/problems/path-sum/

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
    def hasPathSum(self, root: TreeNode, targetSum: int) -> bool:
        if root is None:
            return False

        return self.checkSum(root, targetSum)

    def checkSum(self, node: TreeNode, targetSum: int, currentSum: int=0):
        currentSum += node.val
        if currentSum == targetSum and self.isLeaf(node):
            return True

        leftFound = False
        if node.left is not None:
            leftFound = self.checkSum(node.left, targetSum, currentSum)

        rightFound = False
        if (not leftFound) and node.right is not None:
            rightFound = self.checkSum(node.right, targetSum, currentSum)

        return leftFound or rightFound

    def isLeaf(self, node: TreeNode) -> bool:
        return node.left is None and node.right is None


# TEST AREA
s = Solution()

t = TreeNode.createTree([-2, None, -3])
print(s.hasPathSum(t, -5))
