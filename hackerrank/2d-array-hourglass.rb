# https://www.hackerrank.com/challenges/2d-array/problem

def hourglassSum(arr)
  highest = -Float::INFINITY
  (0..3).each do |r|
    (0..3).each do |c|
      sum = arr[r].slice(c, 3).sum() +
        arr[r + 1][c + 1] +
        arr[r+ 2].slice(c, 3).sum()
      highest = sum if sum > highest
    end
  end
  highest
end


# test area
input = [
  [1, 1, 1, 0, 0, 0],
  [0, 1, 0, 0, 0, 0],
  [1, 1, 1, 0, 0, 0],
  [0, 0, 2, 4, 4, 0],
  [0, 0, 0, 2, 0, 0],
  [0, 0, 1, 2, 4, 0],
]

p hourglassSum(input)
