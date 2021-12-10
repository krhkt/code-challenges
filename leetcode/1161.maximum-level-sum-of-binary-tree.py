# https://leetcode.com/problems/maximum-level-sum-of-a-binary-tree/


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    # breadth-first using list of nodes
    def maxLevelSum(self, root: TreeNode) -> int:
        currentLevel = 0
        maxLevel = 1
        maxSum = root.val
        levelNodes = [root]

        while (len(levelNodes) > 0):
            newLevelNodes = []
            levelSum = 0
            for node in levelNodes:
                levelSum += node.val
                if node.left is not None:
                    newLevelNodes.append(node.left)
                if node.right is not None:
                    newLevelNodes.append(node.right)

            currentLevel += 1
            if levelSum > maxSum:
                maxSum = levelSum
                maxLevel = currentLevel

            levelNodes = newLevelNodes

        return maxLevel

    #breadth first using queue (slower and more memory than the first option)
    def maxLevelSumQueue(self, root: TreeNode) -> int:
        currentLevel = 1
        maxLevel = 1
        maxSum = root.val
        nodeQueue = [{'n': root, 'l': currentLevel}]

        currentSum = 0
        while (len(nodeQueue) > 0):
            current = nodeQueue.pop(0)

            if currentLevel < current['l']:
                if currentSum > maxSum:
                    maxSum = currentSum
                    maxLevel = currentLevel
                currentLevel = current['l']
                currentSum = current['n'].val
            else:
                currentSum += current['n'].val

            if current['n'].left is not None:
                nodeQueue.append({'n': current['n'].left, 'l': currentLevel + 1})
            if current['n'].right is not None:
                nodeQueue.append({'n': current['n'].right, 'l': currentLevel + 1})

        if currentSum > maxSum:
            maxLevel = currentLevel

        return maxLevel


# TEST AREA
s = Solution()

root = TreeNode(1,
                left=TreeNode(2),
                right=TreeNode(3))

print(s.maxLevelSumQueue(root))
