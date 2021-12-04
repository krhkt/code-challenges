#https://leetcode.com/problems/reverse-integer/

class Solution:
    min_int = -2 ** 31
    max_int = (2 ** 31) - 1

    def reverse(self, x: int) -> int:
        is_negative = x < 0
        if is_negative:
            x *= -1

        inverted_number = 0
        current_place = 10
        mod = x % current_place
        acc = 0
        while acc < x:
            inverted_number = (inverted_number * 10) + (mod // (current_place // 10))

            if inverted_number > self.max_int or inverted_number < self.min_int:
                return 0

            acc = mod
            current_place *= 10
            mod = x % current_place

        return -inverted_number if is_negative else inverted_number


# test area
v = Solution()
