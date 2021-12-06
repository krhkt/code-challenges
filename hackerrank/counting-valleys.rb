# https://www.hackerrank.com/challenges/counting-valleys/problem

def counting_valleys(_, path)
  valleys_total = 0

  path.split('').reduce(0) do |acc, step|
    delta = step == 'D' ? -1 : 1
    acc += delta
    valleys_total += 1 if acc.zero? && delta.positive?
    acc
  end
  
  valleys_total
end

# TODO
# possible optimizations:
#   since the size of the path is known,
#   and the rule dictates that a path starts and ends at sea level,
#   if the hiker is as deep or as high as the remaining
#   steps to take, the method could return early with the result
#   however, the time complexity remains O(n)
def counting_valleys(total_steps, path)
  valleys_total = 0

  path.split('').reduce(0) do |acc, step|
    delta = step == 'D' ? -1 : 1
    acc += delta
    return # TODO
    valleys_total += 1 if acc.zero? && delta.positive?
    acc
  end
  
  valleys_total
end


p counting_valleys(0, 'DDDUDUDUUDUUUDUD')
