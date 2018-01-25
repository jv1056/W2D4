def bad_two_sum(arr, target = 0)
  arr.combination(2).map {|pairs| pairs.reduce(:+)}.any? {|el| el == target}
#O(n**2)
end

def okay_two_sum(arr, target = 0)
  sorted = arr.sort
  array_idxs = (0...sorted.length).to_a
  sorted.each_index do |idx|
    return true if array_idxs.bsearch do |el|
      sorted[el] == target - sorted[idx] && el != idx
    end
  end
  false
end #O(2nlogn)

def best_two_sum(arr, target = 0)
  arr_hash = Hash.new(false)

  arr.each {|el| arr_hash[el] = true}

  arr.any? {|el| arr_hash[target - el] == true}
end
#wow O(n) time..!
