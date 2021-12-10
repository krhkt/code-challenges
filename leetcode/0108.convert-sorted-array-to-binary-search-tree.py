# https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/

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
    def sortedArrayToBST(self, nums: List[int]) -> TreeNode:
        size = len(nums)
        if size == 0:
            return None

        middle = size // 2

        node = TreeNode(nums[middle])
        node.left = self.sortedArrayToBST(nums[:middle])
        node.right = self.sortedArrayToBST(nums[middle + 1:])

        return node


# TEST AREA
s = Solution()
s.sortedArrayToBST([0, 1, 2, 3, 4]).toString()
