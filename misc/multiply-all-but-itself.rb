# given an array of numbers, return another array
# of the size, having in each position i, a number
# that is the multiplication of all elements besides
# the original element at position i

# O(n)
def multiply_all_but_itself(numbers)
  total_multiplication = numbers.reduce(&:*)
  numbers.map { |n| total_multiplication / n }
end


# test area
p multiply_all_but_itself([1, 2, 4, 8])
