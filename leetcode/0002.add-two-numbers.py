from __future__ import annotations
# https://leetcode.com/problems/add-two-numbers/
#
# You are given two non-empty linked lists representing two non-negative integers. The digits
# are stored in reverse order, and each of their nodes contains a single digit. Add the two
# numbers and return the sum as a linked list.
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.


class AddTwoNumbers:
    #Definition for singly-linked list.
    class ListNode:
        def __init__(self, val=0, next=None):
            self.val = val
            self.next = next

    class Solution:
        def addTwoNumbers(self, l1: 'ListNode', l2: 'ListNode') -> 'ListNode':
            firstNumber = self.readNumberFromList(l1)
            secondNumber = self.readNumberFromList(l2)

            result = firstNumber + secondNumber

            return self.createListFromNumber(result)

        def readNumberFromList(self, l: 'ListNode') -> int:
            if l is None:
                return 0

            total = 0
            i = 1
            while l is not None:
                total += (l.val * i)
                i *= 10
                l = l.next

            return total

        def createListFromNumber(self, number: int) -> 'ListNode':
            firstNode = None
            currentNode = None
            factor = 10
            acc = 0

            while True:
                value = (number % factor) - acc
                digit = value // (factor // 10)
                acc += value
                factor *= 10
                newNode = AddTwoNumbers.ListNode(digit)
                if firstNode is None:
                    firstNode = newNode
                    currentNode = newNode
                else:
                    currentNode.next = newNode
                    currentNode = newNode

                if acc == number:
                    break

            return firstNode
    pass
