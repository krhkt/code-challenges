# https://leetcode.com/problems/binary-tree-level-order-traversal-ii/

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
    def levelOrderBottom(root: TreeNode) -> List[List[int]]:
        if root is None:
            return []

        traversalOrder = []

        currentLevel = [root]
        while len(currentLevel) > 0:
            nextLevel = []
            currentLevelValues = []
            for n in currentLevel:
                currentLevelValues.append(n.val)
                if n.left is not None:
                    nextLevel.append(n.left)
                if n.right is not None:
                    nextLevel.append(n.right)

            traversalOrder.insert(0, currentLevelValues)
            currentLevel = nextLevel

        return traversalOrder


# TEST AREA

s = Solution()
tree = TreeNode(3,
                TreeNode(4,
                         TreeNode(7),
                         TreeNode(1)
                         ),
                TreeNode(5, None, TreeNode(7))
                )

result = s.levelOrderBottom(tree)

print(result)
