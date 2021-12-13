# https://www.hackerrank.com/challenges/two-strings/problem

require 'set'

def twoStrings(s1, s2)
  seen = Set.new
  s1.chars.each do |c|
    next if seen.include? c
    seen.add c

    return 'YES' if s2.include? c
  end

  return 'NO'
end