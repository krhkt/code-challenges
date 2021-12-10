# https://leetcode.com/problems/divide-two-integers/
# Constraints:
#   - (-231) <= dividend, divisor <= 231 - 1
#   - divisor != 0

class Solution:
    min = -2 ** 31
    max = (2 ** 31) - 1

    def divide(self, dividend: int, divisor: int) -> int:
        print('{:032b}'.format(dividend))
        return 0

    # avoiding multiplications and divisions 
    def divideV2(self, dividend: int, divisor: int) -> int:
        acc = acc_fast = quotient = 0

        is_dividend_neg = dividend < 0
        is_divisor_neg = divisor < 0

        dividend = abs(dividend)
        divisor = abs(divisor)

        if divisor == 1:
            quotient = -dividend if is_dividend_neg != is_divisor_neg else dividend
        else:
            if dividend < divisor:
                return 0

            while acc < dividend:
                if acc_fast < dividend:
                    # 10 times
                    skip_forward = (divisor + divisor + divisor + divisor + divisor + divisor + divisor + divisor + divisor + divisor)
                    # 100 times
                    skip_forward += (skip_forward + skip_forward + skip_forward + skip_forward + skip_forward + skip_forward + skip_forward + skip_forward + skip_forward)
                    # 500 times
                    skip_forward += skip_forward + skip_forward + skip_forward + skip_forward
                    acc_fast += skip_forward
                    if acc_fast < dividend:
                        quotient += 500
                        acc = acc_fast
                        continue
                acc += divisor
                quotient += 1

            if acc > dividend:
                quotient -= 1

            if is_dividend_neg != is_divisor_neg:
                quotient = -quotient

        return max(Solution.min, min(Solution.max, quotient))


    # time limit exceeded
    def divideV1(self, dividend: int, divisor: int) -> int:
        acc = quotient = 0

        is_dividend_neg = dividend < 0
        is_divisor_neg = divisor < 0

        dividend = abs(dividend)
        divisor = abs(divisor)

        if divisor == 1:
            quotient = -dividend if is_dividend_neg != is_divisor_neg else dividend
        else:
            if dividend < divisor:
                return 0

            while acc < dividend:
                acc += divisor
                quotient += 1

            if acc > dividend:
                quotient -= 1

            if is_dividend_neg != is_divisor_neg:
                quotient = -quotient

        return max(Solution.min, min(Solution.max, quotient))




# TEST AREA
print(Solution().divide(-2, 2)) # 2147483647, 3))
