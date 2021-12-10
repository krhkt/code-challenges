# https://leetcode.com/problems/rotated-digits/

class Solution:
    rotationTableDigit = {
        0: 0,
        1: 1,
        2: 5,
        5: 2,
        6: 9,
        8: 8,
        9: 6,
    }

    rotationTable = {
        '0': '0',
        '1': '1',
        '2': '5',
        '5': '2',
        '6': '9',
        '8': '8',
        '9': '6',
    }

    def rotatedDigits(self, n: int) -> int:
        count = 0
        for cNumber in range(1, n + 1):
            if self.isNumberRotatableByStr(cNumber):
                count += 1

        return count

    # this is V2 and it's way slower than V1
    # memory consumption is about the same
    def isNumberRotatable(self, n: int) -> bool:
        decimalPosition = 1
        acc = 0
        rotated = 0
        while acc != n:
            nextDecimalPosition = decimalPosition * 10
            curPlace = ((n % nextDecimalPosition) - acc)
            acc += curPlace

            curDigit = curPlace // decimalPosition
            if curDigit in Solution.rotationTableDigit:
                rotated += (Solution.rotationTableDigit[curDigit] * decimalPosition)
            else:
                return False
            decimalPosition = nextDecimalPosition

        print(n, rotated, n != rotated)

        return n != rotated

    # this was V1
    def isNumberRotatableByStr(self, n: int) -> bool:
        nt = str(n)
        rotated = ''

        for digit in nt:
            if digit in Solution.rotationTable:
                rotated += Solution.rotationTable[digit]
            else:
                return False

        print(nt, rotated, nt != rotated)

        return nt != rotated


print(Solution().rotatedDigits(25))
