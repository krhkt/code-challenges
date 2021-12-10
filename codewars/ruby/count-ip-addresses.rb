# https://www.codewars.com/kata/526989a41034285187000de4/train/ruby

def ipsBetween(start, ending)
  start_classes = start.split('.').map(&:to_i)
  ending_classes = ending.split('.').map(&:to_i)

  ending_classes
  .each_with_index
  .map { |e, i| e - start_classes[i] }
  .reduce(0) { |acc, e| acc * 256 + e }
end

def ipsBetween_v0(start, ending)
  start_classes = start.split('.').map(&:to_i)
  ending_classes = ending.split('.').map(&:to_i)

  ending_classes
  .each_with_index
  .map { |e, i| e - start_classes[i] }
  .each_with_index
  .reduce(0) { |acc, (e, i)| acc + (e * (256 ** (3 - i))) }
end


# test area
p ipsBetween("10.0.0.0", "10.0.0.50")