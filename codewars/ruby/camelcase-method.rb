# https://www.codewars.com/kata/587731fda577b3d1b0001196/train/ruby

# monkey patching
class String
  def camelcase
    strip.split(' ').map(&:capitalize).join
  end
end