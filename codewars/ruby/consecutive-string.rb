# https://www.codewars.com/kata/56a5d994ac971f1ac500003e/train/ruby

# trying to focus on perfomance
# O(n)
def longest_consec(strarr, k)
  return '' unless k.between?(1, strarr.size)

  longest_idx = 0
  current_length = strarr[0..k].sum &:length
  max_length = current_length
  strarr[k..-1].each_with_index do |e, i|
    # by removing the first element of the previous window
    # and adding the last element of the new one, 
    #it's possible to avoid an internal k loop
    current_length = current_length - strarr[i - k].length + e.length
    next unless current_length > max_length
    
    longest_idx = i - k + 1
    max_length = current_length
  end

  strarr.slice(longest_idx, k).join()
end


# trying idiomatic approach
# n = strarr.length
# O(n * k)
def longest_consec_v1(strarr, k)
  return '' unless k.between?(1, strarr.size)
  
  strarr.each_cons(k).map(&:join).max_by(&:length)
end


#testing inject
# O(n * k)
def longest_consec_v0(strarr, k)
  return '' if strarr.empty? || strarr.size < k || k <= 0
  
  longest = strarr.each_cons(k).inject do |memo, tuple|
    tuple.sum(&:length) > memo.sum(&:length) ? tuple : memo
  end

  longest.join()
end


# test area
p longest_consec(%w[tree foling trashy blue abcdef uvwxyz], 2)
p longest_consec(%w[tree foling trashy blue abcdef uvwxyz], 1)
p longest_consec(%w[tree foling trashy blue abcdef uvwxyz], 3)