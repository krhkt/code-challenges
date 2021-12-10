# https://www.hackerrank.com/challenges/minimum-swaps-2/problem

def minimumSwaps(arr)
  swaps = 0
  i = 0
  while i < arr.size
    expected_element = i + 1
    element = arr[i]
    if element == expected_element
      i += 1
      next
    end

    final_position = element - 1
    arr[final_position], arr[i] = element, arr[final_position]
    swaps += 1
  end

  swaps
end

p minimumSwaps([4, 3, 1, 2])