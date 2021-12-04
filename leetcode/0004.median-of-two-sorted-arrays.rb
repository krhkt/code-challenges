# https://leetcode.com/problems/median-of-two-sorted-arrays/

# O(m+n) doesn't seem to be the desired answer
# m size of nums1
# n size of nums2
def find_median_sorted_arrays(nums1, nums2)
  median_values = []
  total_size = nums1.size + nums2.size
  upper_bound = total_size / 2

  i1, i2 = 0, 0
  (0..upper_bound).each do |i|
    if i1 == nums1.size || (i2 < nums2.size && nums1[i1] >= nums2[i2])
      current = nums2[i2]
      i2 += 1
    else
      current = nums1[i1]
      i1 += 1
    end

    if (total_size.even? && (i + 1) == upper_bound) || i == upper_bound
      median_values.push(current)
    end
  end

  median_values.reduce(:+).to_f / median_values.size
end


# test area
p find_median_sorted_arrays([1, 2], [3])
p find_median_sorted_arrays([1, 2], [3, 4])
p find_median_sorted_arrays([3, 4], [1, 2])