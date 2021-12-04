#https://leetcode.com/problems/roman-to-integer

class Solution:
    def romanToInt(self, s: str) -> int:
        valueTable = {
            'I': 1,
            'V': 5,
            'X': 10,
            'L': 50,
            'C': 100,
            'D': 500,
            'M': 1000,
        }

        total = 0
        currentLetterValue = None
        currentTotal = 0
        for letter in s:
            value = valueTable[letter]

            if currentLetterValue is None:
                currentTotal += value
            elif currentLetterValue != value:
                if currentLetterValue is not None and currentLetterValue < value:
                    currentTotal *= -1

                total += currentTotal
                currentTotal = value
            else:
                currentTotal += value

            currentLetterValue = value

        total += currentTotal

        return total


v = Solution()
print(
    v.romanToInt('MCMXCIV')
)
