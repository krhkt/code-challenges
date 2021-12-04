# https://www.hackerrank.com/challenges/jumping-on-the-clouds/problem

def jumping_on_clouds(c)
  position = 0
  jumps = 0
  upper_bound = c.size - 1
  while position < upper_bound
    large_jump = c[position + 2]
    if !large_jump.nil? && large_jump.zero?
      position += 2
      jumps += 1
      next
    end

    position += 1
    jumps += 1
  end

  jumps
end
