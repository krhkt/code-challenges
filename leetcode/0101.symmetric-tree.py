# https://leetcode.com/problems/symmetric-tree/

class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def isSymmetric(self, root: TreeNode) -> bool:
        if root is None:
            return True

        return self.isMirrorOf(root.left, root.right)

    def isMirrorOf(self, treeA: TreeNode, treeB: TreeNode) -> bool:
        if treeA is None and treeB is None:
            return True

        if treeA is None or treeB is None:
            return False

        if treeA.val != treeB.val:
            return False

        return (self.isMirrorOf(treeA.left, treeB.right)
               and self.isMirrorOf(treeA.right, treeB.left))

