# https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/

from typing import List


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def zigzagLevelOrder(self, root: TreeNode) -> List[List[int]]:
        levelOrder = []

        if root is None:
            return levelOrder

        zigzagOrder = 0
        levelNodes = [root]
        while len(levelNodes) > 0:
            nextLevelNodes = []
            currentLevelOrder = []
            for n in levelNodes:
                currentLevelOrder.append(n.val)
                if n.left is not None:
                    nextLevelNodes.append(n.left)
                if n.right is not None:
                    nextLevelNodes.append(n.right)

            if zigzagOrder % 2 == 0:
                levelOrder.append(currentLevelOrder)
            else:
                levelOrder.append(currentLevelOrder[::-1])

            levelNodes = nextLevelNodes
            zigzagOrder += 1

        return levelOrder
