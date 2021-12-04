# https://leetcode.com/problems/balanced-binary-tree/

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
    def isBalanced(self, root: TreeNode) -> bool:
        balancedHeight = self.checkSubtreeBalance(root)

        return balancedHeight != -1

    def checkSubtreeBalance(self, root: TreeNode) -> int:
        if root is None:
            return 0

        leftHeight = self.checkSubtreeBalance(root.left)
        rightHeight = self.checkSubtreeBalance(root.right)

        if leftHeight == -1 or rightHeight == -1:
            return -1

        leftHeight += 1
        rightHeight += 1

        diff = leftHeight - rightHeight
        if diff < -1 or diff > 1:
            return -1

        return leftHeight if leftHeight > rightHeight else rightHeight

    # V1 vvvvvvvvvvvvvvvvvvvv
    def isBalancedV1(self, root: TreeNode) -> bool:
        if root is None:
            return True

        leftHeight = self.subtreeHeight(root.left)
        rightHeight = self.subtreeHeight(root.right)

        diff = abs(leftHeight - rightHeight)
        if diff > 1:
            return False

        return self.isBalanced(root.left) and self.isBalanced(root.right)

    def subtreeHeight(self, root: TreeNode) -> int:
        if root is None:
            return 0

        right = 1 + self.subtreeHeight(root.right)
        left = 1 + self.subtreeHeight(root.left)

        return right if right > left else left

    # V0 vvvvvvvvvvvvvvvvv
    def isBalancedV0(self, root: TreeNode) -> bool:
        if root is None:
            return True

        diff = self.treeHeight(root.left) - self.treeHeight(root.right)

        return -1 <= diff <= 1

    def treeHeight(self, root: TreeNode) -> int:
        if root is None:
            return 0

        level = [root]
        height = 0
        while len(level) > 0:
            height += 1
            nextLevel = []
            for n in level:
                if n.left is not None:
                    nextLevel.append(n.left)
                if n.right is not None:
                    nextLevel.append(n.right)
            level = nextLevel

        return height


#TEST AREA
s = Solution()

tree = TreeNode(1,
                TreeNode(2,
                         TreeNode(3,
                                  TreeNode(4)
                                  )
                         ),
                TreeNode(2,
                         None,
                         TreeNode(3,
                                  None,
                                  TreeNode(4)
                                  )
                         )
                )

print(s.checkSubtreeBalance(tree))

