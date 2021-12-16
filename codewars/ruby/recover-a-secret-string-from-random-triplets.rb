# https://www.codewars.com/kata/53f40dff5f9d31b813000774/train/ruby

def find_first_and_last graph
  first = nil
  last = nil
  graph.each do |(key, value)|
    first = key if value[:prev].empty?
    last = key if value[:next].empty?
    break if !first.nil? && !last.nil?
  end
  
  graph.delete(first)
  graph.delete(last)

  graph.each do |(key, value)|
    value[:prev].delete(first)
    value[:prev].delete(last)
    value[:next].delete(first)
    value[:next].delete(last)
  end

  [first, last]
end

def create_letter_graph triplets
  graph = {}
  triplets.each do |triplet|
    triplet.each_with_index do |letter, i|
      graph[letter] = {prev: [], next: []} unless graph.key? letter
      node = graph[letter]
      node[:prev].concat(triplet[...i]).uniq!
      node[:next].concat(triplet[(i+1)..]).uniq!
      # node[:prev].concat(triplet[0...i]).uniq! # (codewars ruby 2.5)
      # node[:next].concat(triplet[(i+1)..-1]).uniq! # (codewars ruby 2.5)
    end
  end
  graph
end

def recover_secret triplets
  graph = create_letter_graph(triplets)

  result = " " * graph.size
  start = 0
  last = graph.size - 1
  while start <= last
    letters = find_first_and_last(graph)
    result[start] = letters[0]
    start += 1
    result[last] = letters[1]
    last -= 1
  end

  result
end


# test area
# expected: whatisup
triplets_1 = [
  ['t','u','p'],
  ['w','h','i'],
  ['t','s','u'],
  ['a','t','s'],
  ['h','a','p'],
  ['t','i','s'],
  ['w','h','s']
]

# exptected: mathisfun
triplets_2 = [
  ["t", "s", "f"],
  ["a", "s", "u"],
  ["m", "a", "f"],
  ["a", "i", "n"],
  ["s", "u", "n"],
  ["m", "f", "u"],
  ["a", "t", "h"],
  ["t", "h", "i"],
  ["h", "i", "f"],
  ["m", "h", "f"],
  ["a", "u", "n"],
  ["m", "a", "t"],
  ["f", "u", "n"],
  ["h", "s", "n"],
  ["a", "i", "s"],
  ["m", "s", "n"],
  ["m", "s", "u"]
]

# table = recover_secret(triplets_1)
# p find_first_and_last(table)
# table.each do |(key, value)|
#   p [key, value]
# end

p recover_secret(triplets_2)

# table1 = create_letter_table triplets_1
# table2 = create_letter_table triplets_2

# table1.each do |(key, value)|
#   p [key, value]
# end
# p '------'
# table2.each do |(key, value)|
#   p [key, value]
# end