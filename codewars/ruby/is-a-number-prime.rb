# https://www.codewars.com/kata/5262119038c0985a5b00029f/train/ruby

def isPrime?(num)
  return true if num == 2
  return false if num == 1 or num % 2 == 0 or num <= 0
  num = num.abs
  max = Integer.sqrt(num)
  
  (3..max).step(2) do |n|
    return false if num % n == 0
  end

  return true
end

def test_prime(hi)
  require 'prime'

  (1..hi).each do |n|
    puts "#{n.to_s} | #{isPrime?(n)} (valid: #{isPrime?(n) == n.prime?})"
  end

  puts
end

test_prime(1000)