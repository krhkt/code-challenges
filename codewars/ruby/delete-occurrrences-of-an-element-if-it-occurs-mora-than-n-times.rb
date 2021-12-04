# https://www.codewars.com/kata/554ca54ffa7d91b236000023/train/ruby

# refs
# each_with_object  https://ruby-doc.org/core-2.4.1/Enumerable.html#method-i-each_with_object
# select            https://ruby-doc.org/core-2.4.1/Enumerable.html#method-i-select
# Hash.new          https://ruby-doc.org/core-3.0.2/Hash.html#method-c-new

def delete_nth(order, max_e)
  # when creating a hash with a value
  # all non-existent keys will return the default value
  occurrences = Hash.new 0
  # the and operator in ruby is different than the logical operator &&
  # and operator is a guard operator but its best use is as a composition operator
  # same goes for or
  # could use the same unless check as v1, just trying new ways
  # the difference here is that it WILL execute the left side before
  # testing the right side, that's why the check has to include a =
  # on the other hand, the condition feels more natural, since you
  # can check against the absolute values, instead of the one before it
  order.select { |e| occurrences[e] += 1 and occurrences[e] <= max_e }
end

# trying a more idiomatic approach
# O(n * max_e)
def delete_nth_v1(order, max_e)
  # iterates having an arbitrary given object as part of the loop
  # returns the given object
  order.each_with_object([]) { |e, arr| arr << e unless arr.count(e) >= max_e }
end

# first attempt
# O(n)
def delete_nth_v0(order, max_e)
  occurrences = {}
  order.select do |e|
    occurrences[e] = 0 unless occurrences.key? e
    occurrences[e] += 1
    occurrences[e] <= max_e
  end
end


# test area
p delete_nth_v0([1,2,4,1,1,3,4,2,2,3,4,2,2,3,2,1], 2)
p delete_nth_v1([1,2,4,1,1,3,4,2,2,3,4,2,2,3,2,1], 2)
p delete_nth([1,2,4,1,1,3,4,2,2,3,4,2,2,3,2,1], 2)
