# https://leetcode.com/problems/maximum-difference-between-increasing-elements/

# n -> number of elements in nums
  # outer loop: n times
  # inner loops: (2 * n)
  # O(n^2) time
  # O(n) memory
def maximum_difference_v1(nums)
  nums[...-1].each_with_index.reduce(-1) do |acc, (base, i)|
    [acc, *nums[i+1..].map { |e| e > base ? e - base : -1 }].max
  end
end

# O(n) time complexity
# O(1) space  complexity
def maximum_difference(nums)
  memo = {min: Float::INFINITY, max_diff: -1}
  nums.each do |e|
    if e < memo[:min]
      memo[:min] = e
    elsif memo[:min] < e
      memo[:max_diff] = [memo[:max_diff], e - memo[:min]].max
    end
    memo
  end
  
  memo[:max_diff]
end

# using reduce here just for the sake of it
def maximum_difference_v2(nums)
  memo = {min: Float::INFINITY, max_diff: -1}
  nums.reduce(memo) do |memo, e|
    if e < memo[:min]
      memo[:min] = e
    elsif memo[:min] < e
      memo[:max_diff] = [memo[:max_diff], e - memo[:min]].max
    end
    memo
  end[:max_diff]
end


#test area
p maximum_difference([7,1,5,4]) #4
p maximum_difference([9,4,3,2]) #-1
p maximum_difference([1,5,2,10]) #9
p maximum_difference([999,997,980,976,948,940,938,928,924,917,907,907,881,878,864,862,859,857,848,840,824,824,824,805,802,798,788,777,775,766,755,748,735,732,727,705,700,697,693,679,676,644,634,624,599,596,588,583,562,558,553,539,537,536,509,491,485,483,454,449,438,425,403,368,345,327,287,285,270,263,255,248,235,234,224,221,201,189,187,183,179,168,155,153,150,144,107,102,102,87,80,57,55,49,48,45,26,26,23,15])
