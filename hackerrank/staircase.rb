def staircase(n)
  (1..n).each { |i| puts ' ' * (n - i) << '#' * i }
end

staircase(6)