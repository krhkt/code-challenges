#https://www.codewars.com/kata/5287e858c6b5a9678200083c/train/ruby

def narcissistic?(value)
  last_power, power, sum = [1, 10, 0]
  numbers = []
  until sum >= value
    num = (value % power) - sum
    sum += num
    num /= last_power
    numbers.push(num)
    last_power = power
    power *= 10
  end

  number_of_digits = numbers.length
  total = numbers.reduce(0) { | acc, n | acc + (n ** number_of_digits) }

  total === value
end

puts narcissistic?(153)