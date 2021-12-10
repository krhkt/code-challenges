# https://leetcode.com/problems/flatten-binary-tree-to-linked-list/

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

    def print(self):
        print(self.val, end=' ')
        print('[l: ', end='')
        self.left.print() if self.left is not None else print('-', end='')
        # print(')', end='')
        print('r: ', end='')
        self.right.print() if self.right is not None else print('-', end='')
        print(']', end='')

    def __str__(self):
        return '[' + self.val + ']'


class Solution:
    def flatten(self, root: TreeNode) -> None:
        if root is None:
            return

        right = root.right
        left = root.left
        root.right = left
        root.left = None

        if left is not None:
            self.flatten(root.right)

        if right is None:
            return

        lastNode = root
        while lastNode.right is not None:
            lastNode = lastNode.right

        lastNode.right = right
        self.flatten(lastNode.right)

    # intial version
    def flattenV1(self, root: TreeNode) -> None:
        if root is None:
            return

        right = root.right
        left = root.left
        root.right = left
        root.left = None

        self.flatten(root.right)

        lastNode = root
        while lastNode.right is not None:
            lastNode = lastNode.right

        lastNode.right = right
        self.flatten(lastNode.right)


# TEST AREA
s = Solution()
l = [1,2,5,3,4,None,6]
t = TreeNode.createTree(l)
t.print()

s.flatten(t)
print()
t.print()


