def first_anagram?(str, str2)
  str.chars.permutation.map(&:join).include?(str2)
end
# O(n!) (but more... something like 3n!)

def second_anagram?(str, str2)
  str1_copy = str.dup
  str2_copy = str2.dup

  str.chars.each do |char|
    str2_copy.sub!(char,"")
  end

  str2.chars.each do |char|
    str1_copy.sub!(char,"")
  end

  str2_copy == "" && str1_copy == ""
end
# O(n**2) because sub is like a nested loop inside each

def third_anagram(str, str2)
  str.chars.sort == str2.chars.sort
end
# O(n log n)

def fourth_anagram?(str, str2)
  letters1 = str.chars
  letter1_hash = Hash.new(0)
  letters2 = str2.chars

  letters1.each do |char|
    letter1_hash[char] += 1
  end
  letters2.each do |char|
    letter1_hash[char] -= 1
  end

  letter1_hash.values.all?(&:zero?)
end

# O(n) but actually more like 5n
