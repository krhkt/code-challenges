# https://www.codewars.com/kata/57814d79a56c88e3e0000786/train/ruby

def encrypt(text, n)
  return text unless n.positive?

  odds = text.chars.select.with_index { |_,i| i.odd? }.join
  evens = text.chars.select.with_index { |_,i| i.even? }.join

  encrypt(odds + evens, n - 1)
end

def encrypt_v0(text, n)
  return text unless n.positive? && !text.empty?

  (1..n).inject(text) do |t| 
    t.chars.each_with_index
    .group_by { |e, i| i.even? }.values
    .reverse.map { |a| a.flat_map(&:first) }
    .join()
  end
end

def decrypt(encrypted_text, n)
  return encrypted_text unless n.positive? && !encrypted_text.empty?

  (1..n).inject(encrypted_text) do |t| 
    chars, middle = t.chars, t.length / 2
    chars.drop(middle).zip(chars.take middle ).join
  end
end


# test area
text = '01234'
n = 1
result = encrypt(text, n)
plain_text = decrypt(result, n)

p [text, result, plain_text]

p encrypt("This is a test!", 1)
