# https://www.hackerrank.com/challenges/crush/problem


def arrayManipulation_v1(n, queries)
  
  queries.each do |query|
    lo, hi, k = query
    (lo-1..hi-1).each { |i| arr[i] += k }
  end

  arr.max
end

# naive solution
def arrayManipulation_v1(n, queries)
  arr = Array.new(n, 0)

  queries.each do |query|
    lo, hi, k = query
    (lo-1..hi-1).each { |i| arr[i] += k }
  end

  arr.max
end