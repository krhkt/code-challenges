# https://leetcode.com/problems/path-sum-ii/

from typing import List


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

    @staticmethod
    def createTree(values: List[int] = None):
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

            if node is None:
                continue

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
    def pathSum(self, root: TreeNode, targetSum: int) -> List[List[int]]:
        self.paths = []

        self.visitNode(root, targetSum, [], 0)

        return self.paths

    def visitNode(self, node: TreeNode, targetSum: int, pathValues: List[int], currentSum: int):
        if node is None:
            return

        currentSum += node.val
        pathValues.append(node.val)

        if self.isLeaf(node):
            if currentSum == targetSum:
                self.paths.append(pathValues.copy())
        else:
            if node.left is not None:
                self.visitNode(node.left, targetSum, pathValues, currentSum)

            if node.right is not None:
                self.visitNode(node.right, targetSum, pathValues, currentSum)

        pathValues.pop()

    def isLeaf(self, node: TreeNode) -> bool:
        return node.left is None and node.right is None


# TEST AREA
#values = [1, None, 2, None, 3, None, 4, None, 5]
values = [5,4,8,11,None,13,4,7,2,None,None,5,1]
t = TreeNode.createTree(values)

s = Solution()
paths = s.pathSum(t, 22)
print(paths)
