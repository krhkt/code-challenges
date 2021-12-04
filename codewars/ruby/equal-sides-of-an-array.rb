# https://www.codewars.com/kata/5679aa472b8f57fb8c000047/train/ruby

def find_even_index(arr)
  return -1 if arr.nil? || arr.empty?
  
  sum_right = arr.sum
  sum_left = 0
  arr.each_with_index do |e, i|
    sum_right -= e
    return i if sum_left == sum_right
    sum_left += e
  end

  -1
end


puts find_even_index([1, 2, 3, 4, 3, 2, 1])
puts find_even_index([1, 100, 50, -51, 1, 1])
puts find_even_index([20, 10, -80, 10, 10, 15, 35])
