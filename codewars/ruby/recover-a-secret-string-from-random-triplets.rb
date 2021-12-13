# https://www.codewars.com/kata/53f40dff5f9d31b813000774/train/ruby


def recover_secret triplets

end


#region Version 0 (does not work for all cases)
def find_first_and_last table
  first = nil
  last = nil
  table.each do |(key, value)|
    first = key if value[:prev].empty?
    last = key if value[:next].empty?
    break if !first.nil? && !last.nil?
  end
  
  table.delete(first)
  table.delete(last)

  table.each do |(key, value)|
    value[:prev].delete(first)
    value[:next].delete(last)
  end

  [first, last]
end

def recover_secret_v0 triplets
  table = {}
  triplets.each do |triplet|
    triplet.each_with_index do |letter, i|
      table[letter] = {prev: [], next: []} unless table.key? letter
      node = table[letter]
      node[:prev].concat(triplet[...i]).uniq! # triplet[0...i] (codewars ruby 2.5)
      node[:next].concat(triplet[(i+1)..]).uniq! # triplet[(i+1)...-1] (codewars ruby 2.5)
    end
  end

  result = " " * table.size
  start = 0
  last = table.size - 1
  while start <= last
    letters = find_first_and_last(table)
    result[start] = letters[0]
    start += 1
    result[last] = letters[1]
    last -= 1
  end

  result
end
#endregion


# test area
triplets_1 = [
  ['t','u','p'],
  ['w','h','i'],
  ['t','s','u'],
  ['a','t','s'],
  ['h','a','p'],
  ['t','i','s'],
  ['w','h','s']
]

# table = recover_secret(triplets_1)
# p find_first_and_last(table)
# table.each do |(key, value)|
#   p [key, value]
# end

p recover_secret(triplets_1)