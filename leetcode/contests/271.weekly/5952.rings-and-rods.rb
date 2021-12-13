# https://leetcode.com/contest/weekly-contest-271/problems/rings-and-rods/

# each ring is either RED, GREEN, or BLUE
# 10 rods labeled 0, 1, ..., 9

# input string is formed by a color-position pair (each two characters)


def count_points(rings)
  rods = {}
  rings.chars.each_slice(2) do |(color, rod)|
    rods[rod] = {} if !rods.key?(rod)

    rods[rod][color] = true
  end

  rods.reduce(0) do |acc, (key, value)|
    acc + ((value.size >= 3) ? 1 : 0)
  end
end


# test area
p count_points("G4")