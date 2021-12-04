#Grid Traveler
#startin at the top left corner, a traveler can only walk
#down or right. How many paths the traveler can take to reach
#the bottom right cell of the grid

# base cases
# (1, 1) -> 0 (doesn't need to move)
# (x, 1) -> single column, implies x-1 moves to reach the end
# (1, x) -> single row, same as single column

def grid_traveler(m, n)
  return 1 if n == 1 or m == 1

  puts "#{m}, #{n}"
  #walk right means that the grid "shrinks" one column
  #walk down means that the grid "shrinks" one row
  grid_traveler(m, n - 1) + grid_traveler(m - 1, n)
end

def grid_traveler_with_memo(m, n, memo = {})
  low, hi = (m > n ? [n, m] : [m, n])
  key = "#{low}:#{hi}"
  return memo[key] if memo.key?(key)

  return 1 if n == 1 or m == 1

  puts "#{m}, #{n}"
  #walk right means that the grid "shrinks" one column
  #walk down means that the grid "shrinks" one row
  memo[key] = grid_traveler_with_memo(m, n - 1, memo) + grid_traveler_with_memo(m - 1, n, memo)
  memo[key]
end


#test area
puts grid_traveler(3, 3)
puts grid_traveler_with_memo(3, 3)
