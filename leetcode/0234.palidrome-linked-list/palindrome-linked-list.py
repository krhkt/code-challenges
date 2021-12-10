# https://leetcode.com/problems/palindrome-linked-list/

import cProfile
import re

#Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    # O(n) time
    def isPalindrome(self, head: ListNode) -> bool:
        ordered = ''
        reverseOrder = ''
        while head is not None:
            ordered += '|' + str(head.val)
            reverseOrder = str(head.val) + '|' + reverseOrder
            head = head.next

        ordered += '|'
        reverseOrder = '|' + reverseOrder
        print(ordered)
        print(reverseOrder)
        return ordered == reverseOrder

    # worse both in runtime and memory usage than v1
    def isPalindromeV2(self, head: ListNode) -> bool:
        ordered = []
        reverseOrder = []
        while head is not None:
            ordered.append(head.val)
            reverseOrder.insert(0, head.val)
            head = head.next

        return ordered == reverseOrder

    # much faster than the previous 2, and uses less memory
    def isPalindromeV3(self, head: ListNode) -> bool:
        l = []
        while head is not None:
            l.append(head.val)
            head = head.next

        low = 0
        high = len(l) - 1
        while low <= high:
            if l[low] != l[high]:
                return False
            low += 1
            high -= 1

        return True


    #O(1) space (TOO SLOW)
    def isPalindrome_lowMemory(self, head: ListNode) -> bool:
        tail = head
        cur = head
        count = 0
        while cur:
            tail = cur
            cur = cur.next
            count += 1

        if head is None:
            return True

        i = 0
        middle = count // 2
        mid_pointer = head
        while i < middle:
            mid_pointer = mid_pointer.next
            i += 1

        i = 0
        while i < middle:
            if head.val != tail.val:
                return False

            head = head.next
            cur = mid_pointer
            while cur and cur.next != tail:
                cur = cur.next

            tail = cur
            i += 1

        return True

    # O(1) space THIS ONE WORKS, but destroys the list
    # slower and does not improve memory usage considerably at all
    def isPalindrome_lowMemoryV2(self, head: ListNode) -> bool:
        if head is None or head.next is None:
            return True

        pSingle = head
        pDouble = head
        prev = None
        firstHalf = head

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

def convertArrToList(arr):
    h = cur = None
    for elem in arr:
        n = ListNode(elem)
        if cur is None:
            cur = n
            h = cur
        else:
            cur.next = n
            cur = n

    return h

# f = open('palindrome-linked-list_test-case-001.txt', 'r')
# test_case = []
# for line in f:
#     if line != '':
#         test_case.append(int(line))
#
# f.close()
#
#
# print(len(test_case))
#
# list_test = convertArrToList(test_case)
#
# cProfile.run('print(Solution().isPalindrome_lowMemoryV2(list_test))')


#result = Solution().isPalindrome_lowMemory(list_test)

#print(result)
