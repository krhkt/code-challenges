# https://www.codewars.com/kata/52774a314c2333f0a7000688/train/ruby

# ref
# reduce  https://ruby-doc.org/core-2.4.1/Enumerable.html#method-i-reduce

# well... I'm sticking with this one, even though it's making more tests per loop
def valid_parentheses(text)
  text.chars.reduce(0) do |acc, c|
    acc += 1 if c == '('
    acc -= 1 if c == ')'
    return false if acc < 0
    acc
  end
  .zero?
end

# is this any better??
def valid_parentheses_v1(text)
  text.chars.reduce(0) do |acc, c|
    if c == '('
      acc += 1
    elsif c == ')'
      return false unless acc > 0
      acc -= 1
    end
    acc
  end
  .zero?
end

# ugly but correct
def valid_parentheses_v0(text)
  text.chars
    .reduce(0) do |acc, c|
      acc += case c
      when '(' then 1
      when ')' then acc > 0 ? -1 : -Float::INFINITY
      else 0
      end
    end
    .zero?
end


# test area
p valid_parentheses("hi())(")
p valid_parentheses('((()()()))')
p valid_parentheses('()(()')
p valid_parentheses("hi(hi)()")