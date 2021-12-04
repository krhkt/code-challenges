# https://www.codewars.com/kata/513e08acc600c94f01000001/train/ruby

# strig format = more idiomatic??
def rgb(r, g, b)
  '%02X' * 3 % [r, g, b].map{ |v| v.clamp(0, 255) }
end

# doesn't have specific named params and doesn't
# have runtime check when invoking
# not a good option
def rgb_not_too_readable(*colors)
  '%02X%02X%02X' % colors.map{ |v| v.clamp(0, 255) }
end

def rgb_v0(r, g, b)
  [r, g, b].map { |v| v.clamp(0, 255).to_s(16).upcase.rjust(2, '0') }
    .join
end


p rgb(255, 255, 255)
p rgb(0, 0, 0)
