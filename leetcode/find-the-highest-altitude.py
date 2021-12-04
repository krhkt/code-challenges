# https://leetcode.com/problems/find-the-highest-altitude/

from typing import List


class Solution:
    def largestAltitude(self, gain: List[int]) -> int:
        current = 0
        highest = 0
        for g in gain:
            current += g
            if current > highest:
                highest = current

        return highest
