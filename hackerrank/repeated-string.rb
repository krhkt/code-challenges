# https://www.hackerrank.com/challenges/repeated-string

# the naive solution would be to iterate n times
# looping the position of string over and over using %
def repeated_string(s, n)
  target = 'a'
  partial = n % s.size
  full = n / s.size
  
  partial_acc = 0
  full_acc = 0
  s.each_char.each_with_index do |char, i|
    break if i >= partial && full.zero? #optimizing for long s and small n
    next if char != target

    full_acc += 1
    partial_acc += 1 if i < partial
  end

  partial_acc + (full * full_acc)
end
