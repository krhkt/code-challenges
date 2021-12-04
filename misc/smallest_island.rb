require 'set'

def key_from_index(i, j)
  "#{i}:#{j}"
end

def travel_island_counting(grid, l, r, visited, directions)
  return 0 if l.negative? || l >= grid.size
  return 0 if r.negative? || r >= grid[l].size
  return 0 if grid[l][r].zero?

  key = key_from_index(l, r)
  return 0 if visited === key
  
  visited.add(key)
  size = 1
  directions.each do |dir|
    size += travel_island_counting(grid, l + dir[0], r + dir[1], visited, directions)
  end

  size
end

def smallest_island_size(grid)
  visited = Set[]
  directions = [
    [-1, 0], #north
    [0, 1], #east
    [1, 0], #south
    [0, -1], #west
  ]

  smallest = 0
  grid.each_with_index do |line, l|
    grid.each_with_index do |_, r|
      island_size = travel_island_counting(grid, l, r, visited, directions)
      next if island_size.zero?
      smallest = island_size if smallest.zero? || island_size < smallest
    end
  end

  smallest
end


# test area
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
#expected from input_a: 1

input_b = [
  [1, 1, 1, 0, 1, 1],
  [0, 0, 1, 0, 1, 1],
  [1, 0, 1, 0, 1, 1],
  [1, 1, 1, 1],
  [1, 0, 0, 0, 1, 1],
]
#expected from input_b: 2

input_c = [
  [1, 1, 1, 0],
  [0, 0, 0, 0],
  [1, 1, 1, 1],
  [0, 0, 0, 0],
]
# expected: 3

p smallest_island_size(input_b)
