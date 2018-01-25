class Array
  def my_min

    self.each do |el|
      return el if self.all? {|ele| el <= ele}
    end
  end
  #phase1: time complexity is O(n**2)


  def better_my_min
    min = self.first
    self.each do |el|
      min = el if el < min
    end
    min
  end
  #phase 2: time complexity is O(n)

  def sub_arrays
    result = []
    self.each_index do |i|
      self.each_index do |j|
        result << self[i..j] if j >= i
      end
    end
    result
  end

  def largest_sub_sum #phase1 time complexity is O(n^3)
    self.sub_arrays.map {|sub_array| sub_array.reduce(:+)}.max
  end



  def better_largest_sub_sum
    return self.max if self.all? {|el| el < 0}
    old_best = 0
    working_best = self.first
    i = 1
    while i < self.length
      num = self[i]
      puts i
      if num < 0
        old_best = working_best if working_best > old_best
        working_best = 0
        i += 1
        next
      else
        working_best += num
        i += 1
      end      
    end
    old_best = working_best if working_best > old_best

    old_best
  end
end
