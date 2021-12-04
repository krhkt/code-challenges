# https://www.codewars.com/kata/515de9ae9dcfc28eb6000001/train/ruby

def solution(str)
  str += '_' if str.length.odd?

  str.chars.each_slice(2).map(&:join)
end

def solution_v1(str)
  (str << '_').scan(/../)
end

def solution_v0(str)
  str += '_' if str.length.odd?

  str.scan(/.{2}/)
end

# test area
p solution_v1('abcdef')
