# https://leetcode.com/problems/merge-in-between-linked-lists/
# Constraints:
#  - 3 <= list1.length <= 104
#  - 1 <= a <= b < list1.length - 1
#  - 1 <= list2.length <= 104


# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def mergeInBetween(self, list1: ListNode, a: int, b: int, list2: ListNode) -> ListNode:
        current_l1 = list1
        i = 0
        while i < a:
            merge_start = current_l1
            current_l1 = current_l1.next
            i += 1

        tail_l1 = current_l1
        while i <= b:
            tail_l1 = tail_l1.next
            i += 1

        merge_end = list2
        while merge_end.next is not None:
            merge_end = merge_end.next

        merge_start.next = list2
        merge_end.next = tail_l1

        return list1

    # V2 same processing time, but slight increase in memory use
    def mergeInBetweenV2(self, list1: ListNode, a: int, b: int, list2: ListNode) -> ListNode:
        current_l1 = list1

        for i in range(0, a):
            merge_start = current_l1
            current_l1 = current_l1.next

        tail_l1 = current_l1
        for j in range(i, b):
            tail_l1 = tail_l1.next

        merge_end = list2
        while merge_end.next is not None:
            merge_end = merge_end.next

        merge_start.next = list2
        merge_end.next = tail_l1

        return list1

    def printList(self, list: ListNode):
        current = list
        list_text = '[ '
        while current is not None:
            list_text += str(current.val) + ' '
            current = current.next

        list_text += ' ]'
        print(list_text)


# TEST AREA
l1_a = ListNode(0, ListNode(1, ListNode(2, ListNode(3, ListNode(4)))))
l2_a = ListNode(10, ListNode(20, ListNode(30)))

Solution().printList(l1_a)
Solution().printList(l2_a)

Solution().printList(
    Solution().mergeInBetweenV2(l1_a, 1, 2, l2_a)
)
