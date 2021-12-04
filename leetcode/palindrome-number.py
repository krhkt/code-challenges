#https://leetcode.com/problems/palindrome-number/

class Solution:
    def isPalindrome(self, x: int) -> bool:
        num = str(x)

        lowPointer = 0
        highPointer = len(num) - 1

        while lowPointer <= highPointer:
            if num[lowPointer] != num[highPointer]:
                return False

            lowPointer += 1
            highPointer -= 1

        return True



print(Solution().isPalindrome(10));