# https://www.codewars.com/kata/550498447451fbbd7600041c

def comp(array1, array2)
  return false if array1.nil? or array2.nil?

  array1.each do |n|
    return false if array2.empty?

    index = array2.index(n**2)
    return false if index.nil?

    array2.delete_at(index)
  end

  array2.empty?
end
