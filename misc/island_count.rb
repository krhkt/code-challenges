# frozen_string_literal: true
require 'set'

# Write a function, island_count, that takes in a grid containing 0 and 1.
# 0 - represents water
# 1 - represents land
# The function should return the number of islands on the grid. An island
# is a vertically or horizontally connected region of land.



def key_from_index(i, j)
  "#{i}:#{j}"
end

# returns false if no land move was possible
def depth_search(grid, i, j, visited, cardinal_moves)
  return false if i.negative? || i >= grid.size #line bounds
  return false if j.negative?  || j >= grid[i].size #row bouns
  return false if grid[i][j] == 0 # water means not connected

  key = key_from_index(i, j)
  return false if visited === key

  visited.add(key)
  cardinal_moves.each do |direction|
    next_i, next_j = i + direction[0], j + direction[1]
    breadth_search(grid, next_i, next_j, visited, cardinal_moves)
  end

  true
end

#O(m*n)
def island_count(grid)
  visited = Set[]
  cardinal_moves = [
    [-1, 0], #north
    [0, 1], #east
    [1, 0], #south
    [0, -1], #west
  ]
  
  count = 0
  grid.each_with_index do |line, i|
    line.each_with_index do |_, j|
      count += 1 if depth_search(grid, i, j, visited, cardinal_moves)
    end
  end

  count
end



# V0 works, but the part of the logic of the island walker
# is being double checked inside the method island_count
def depth_search_v0(grid, i, j, visited, cardinal_moves)
  return if i.negative? || j.negative? 
  return if i >= grid.size || j >= grid[i].size
  return if grid[i][j].zero? # water means not connected

  key = key_from_index(i, j)
  return if visited === key

  visited.add(key)
  cardinal_moves.each do |direction|
    next_i, next_j = i + direction[0], j + direction[1]
    breadth_search(grid, next_i, next_j, visited, cardinal_moves)
  end
end

#O(m*n)
def island_count_v0(grid)
  visited = Set[]
  cardinal_moves = [
    [-1, 0], #north
    [0, 1], #east
    [1, 0], #south
    [0, -1], #west
  ]
  
  count = 0
  grid.each_with_index do |line, i|
    line.each_with_index do |cell, j|
      next if visited === key_from_index(i, j)
      next if cell == 0
      
      count += 1
      depth_search_v0(grid, i, j, visited, cardinal_moves)
    end
  end

  count
end

# ----- TEST AREA ----
input_a = [
  [1, 1, 0, 1, 1],
  [1, 0, 0, 0, 1],
  [1, 0, 1, 1, 0],
  [1, 0, 1, 1, 0],
  [1, 0, 0, 0, 0],
  [1, 0, 1, 0, 1],
  [1, 0, 1, 0, 1],
  [0, 1, 1, 0, 1],
  [1, 0, 1, 0, 1],
]
#expected from input_a: 6

input_b = [
  [1, 0, 1, 0, 1, 1],
  [0, 0, 1, 0, 1, 1],
  [1, 0, 1, 0, 1, 1],
  [1, 1, 1, 1],
  [1, 0, 0, 0, 0, 1],
]
#expected from input_b: 4

p island_count(input_a)
