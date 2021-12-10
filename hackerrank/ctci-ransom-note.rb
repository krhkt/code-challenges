# https://www.hackerrank.com/challenges/ctci-ransom-note/problem

# Hash table: random note

# case-sensitive
# only whole words

def checkMagazine(magazine, note)

  note_dictionary = note.each_with_object(Hash.new(0)) do |w, dict|
    dict[w] += 1
  end

  magazine.each do |w|
    note_dictionary[w] -= 1 if note_dictionary.key? w
    note_dictionary.delete w if note_dictionary[w].zero?
    if note_dictionary.size.zero?
      puts 'Yes'
      return
  end

  puts 'No'
end

p checkMagazine('', 'a bee is flying over a flower in the garden of incredible things is bees and bee')