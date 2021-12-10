# https://www.codewars.com/kata/520446778469526ec0000001/train/ruby

class Array
  def same_structure_as(arr)
    return false if !arr.is_a?(Array) || size != arr.size

    each_with_index do |item, index|
      next if !item.is_a? Array

      return false if !item.same_structure_as(arr[index])
    end

    true
  end
end


p [1,[1,1]].same_structure_as([2,[2,2]])
p [1,[1,1]].same_structure_as([[2,2],2])
p [1,[1,1]].same_structure_as([2,[2]])