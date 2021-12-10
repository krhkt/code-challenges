# https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/

class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

    def toString(self):
        current = self
        while current is not None:
            print(str(current.val) + ' ', end='')
            current = current.next

        print('.')


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
    def countListNode(self, head: ListNode, tail: ListNode = None) -> int:
        acc = 0
        current = head
        while current != tail:
            acc += 1
            current = current.next

        return acc

    def getElementByDelta(self, head: ListNode, deltaIndex: int) -> ListNode:
        current = head
        while deltaIndex > 0:
            current = current.next
            deltaIndex -= 1

        return current

    def sortedListToBSTInner(self, head: ListNode, tail: ListNode = None) -> TreeNode:
        size = self.countListNode(head, tail)
        if size == 0:
            return None

        middle = size // 2
        listNode = self.getElementByDelta(head, middle)
        node = TreeNode(listNode.val)
        node.left = self.sortedListToBSTInner(head, listNode)
        node.right = self.sortedListToBSTInner(listNode.next, tail)

        return node

    def sortedListToBST(self, head: ListNode) -> TreeNode:
        return self.sortedListToBSTInner(head)


# TEST AREA
s = Solution()

l = ListNode(1, ListNode(2, ListNode(3)))
l.toString()
s.sortedListToBST(l).toString()
