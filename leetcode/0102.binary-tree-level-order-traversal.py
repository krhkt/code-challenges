# https://leetcode.com/problems/binary-tree-level-order-traversal/

from typing import List


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def levelOrder(self, root: TreeNode) -> List[List[int]]:
        levelOrder = []

        if root is None:
            return levelOrder

        nodesToVisit = [root]
        while len(nodesToVisit) > 0:
            currentNodesToVisit = []
            currentLevelValues = []
            for n in nodesToVisit:
                currentLevelValues.append(n.val)
                if n.left is not None:
                    currentNodesToVisit.append(n.left)
                if n.right is not None:
                    currentNodesToVisit.append(n.right)

            levelOrder.append(currentLevelValues)
            nodesToVisit = currentNodesToVisit

        return levelOrder
