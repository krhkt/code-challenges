# https://leetcode.com/contest/weekly-contest-271/problems/sum-of-subarray-ranges/

def sub_array_ranges(nums)
  differences = []
  (1..nums.size).each do |size|
    last_index = nums.size - size
    smallest = Float::INFINITY
    largest = -Float::INFINITY
    for i in (0..last_index)
      last_element = nums[i + (size - 1)]
      smallest = last_element if last_element < smallest
      largest = last_element if last_element > largest
      differences.push(largest - smallest)
    end
  end

  differences.sum
end


# test area
p sub_array_ranges([4,-2,-3,4,1])