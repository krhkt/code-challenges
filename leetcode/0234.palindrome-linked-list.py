# https://leetcode.com/problems/palindrome-linked-list/

#Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    

    # chanlenge: O(n) time and O(1) memory
    # note: I couldn't find a way to keep it O(1) memory without destroying the list
    def isPalindrome_lowMemoryV2(self, head: ListNode) -> bool:
        if head is None or head.next is None:
            return True

        pSingle = head
        pDouble = head
        prev = None
        firstHalf = head

        # finding the middle
        while pDouble is not None and pDouble.next is not None:
            pDouble = pDouble.next.next
            prev = pSingle
            pSingle = pSingle.next

        # if the list has odd or even elements
        # pDouble = None means that the list is even
        secondHalf = pSingle if pDouble is None else pSingle.next

        # splitting lists
        if prev is not None:
            prev.next = None

        secondHalf = self.reverseList(secondHalf)
        result = self.isEqual(firstHalf, secondHalf)

        return result


    def reverseList(self, head: ListNode):
        prev = None
        cur = head

        while cur is not None:
            next = cur.next
            cur.next = prev
            prev = cur
            cur = next

        return prev


    def isEqual(self, a: ListNode, b: ListNode):
        curA = a
        curB = b

        while curA is not None and curB is not None:
            if curA.val != curB.val:
                return False
            curA = curA.next
            curB = curB.next

        return curA == curB

#test area
a = ListNode(0, ListNode(1, ListNode(0)))
b = ListNode(-10, ListNode(1, ListNode(0, ListNode(1, ListNode(-10)))))
c = ListNode(0, ListNode(0))
d = ListNode(0, ListNode(1, ListNode(1, ListNode(2))))
print(Solution().isPalindrome_lowMemoryV2(
    c
))
