# frozen_string_literals: true

# https://www.codewars.com/kata/52efefcbcdf57161d4000091/train/ruby

# explicit
def count_chars(s)
  tally = {}
  s.chars.each do |c|
    tally[c] = 0 unless tally.key? c
    tally[c] += 1
  end

  tally
end

# v2.7+
def count_chars_2_7(s)
  s.chars.tally
end


# pre ruby 2.7 (codewars uses 2.5)
def count_chars_pre2_7(s)
  s.chars.group_by(&:itself).transform_values(&:size)
end


# test area
p count_chars('test area')
p count_chars('')
