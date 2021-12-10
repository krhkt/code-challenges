# https://leetcode.com/problems/reverse-bits/

class Solution:
    def reverseBits(self, n: int) -> int:
        reverse = '{:032b}'.format(n)

        #print(reverse)

        acc = 0
        for i, bit in enumerate(reverse):
            acc += (int(bit) * (2 ** i))

        #print('{:032b}'.format(acc))
        return acc


c = Solution()
print(c.reverseBits(12))
