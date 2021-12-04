# https://www.codewars.com/kata/54ff3102c1bad923760001f3

def get_count(input_str)
  vowels = %w[a e i o u]
  input_str.chars.reduce(0) do |acc, c|
    acc + (vowels.include?(c) ? 1 : 0)
  end
end

def get_count_v0(input_str)
  total = 0
  probs = %w[a e i o u]
  input_str.chars.each do |c|
    total += 1 if probs.include?(c)
  end

  total
end
