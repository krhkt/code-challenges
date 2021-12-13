# https://www.hackerrank.com/challenges/sherlock-and-anagrams/problem

def sherlockAndAnagrams(s)
  #TODO: use array to count letters instead of a hash
  #      that allows for a sliding window, instead of a 
  #      recounting for each substring

  # note to future me: see my JS solution for this problem
end
#counting array
def count_letter_occurrences(text, start, end)
end

# ==== all solutions bellow this line timeout some test cases ====
def sherlockAndAnagrams_v1(s)
  memo = {}
  pairs_count = 0
  
  (1...s.length).each do |size|
    subs = s.dup
    until subs.length < size
      head = subs[0...size]
      tail = subs[1..]

      tail.chars
      .each_cons(size)
      .map(&:join)
      .each do |slice|
        pairs_count += 1 if anagram?(head, slice, memo)
      end

      subs = subs[1..]
    end
  end

  pairs_count
end


def sherlockAndAnagrams_v0(s)
  pairs_count = 0
  
  (1...s.length).each do |size|
    subs = s.dup

    # this is stupid
    until subs.empty?
      head = subs[0...size]
      tail = subs[1..]

      tail.chars
      .each_cons(size)
      .map(&:join)
      .each do |slice|
        pairs_count += 1 if anagram?(head, slice)
      end

      subs = subs[1..]
    end
  end

  pairs_count
end

def get_key(s1, s2) 
  s1 > s2 ? "#{s1}#{s2}" : "#{s2}#{s1}"
end


def anagram_v2?(s1, s2, memo)
  key = get_key(s1, s2)
  return memo[key] if memo.key? key

  occurrences = s1.chars
  .each_with_object(Hash.new(0)) do |e, table|
    table[e] += 1
    table
  end

  s2.chars.each do |c|
    return memo[key] = false if !occurrences.key?(c)

    occurrences[c] -= 1
    occurrences.delete(c) if occurrences[c].zero?
  end

  memo[key] = occurrences.empty?
end

def anagram_v1?(s1, s2)
  occurrences = s1.chars
  .each_with_object(Hash.new(0)) do |e, table|
    table[e] += 1
    table
  end

  s2.chars.each do |c|
    return false if !occurrences.key?(c)

    occurrences[c] -= 1
    occurrences.delete(c) if occurrences[c].zero?
  end

  occurrences.empty?
end

def anagram_v0?(s1, s2)
  s2_chars = s2.chars
  s1.chars.each do |c|
    return false if s2_chars.empty?

    index = s2_chars.index(c)
    next if  index.nil?

    s2_chars.delete_at(index)
  end

  s2_chars.empty?
end


# test area

#p anagram?('cabba', 'cabab')
#p sherlockAndAnagrams('abba')

p sherlockAndAnagrams('cdcd')