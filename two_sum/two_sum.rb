# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

# two_sum([1,5,7,8,10], 12)
# 5 is at index 1; 7 is at index 2
# => [1,2]

# You may assume that each input would have exactly one solution, and you may not use the same element twice.

# You can return the answer in any order.

def two_sum(nums, target)
  nums.each_with_index do |num, index|
    new_array = nums.dup.tap{|i| i.delete_at(index)}
    puts new_array
  end
end

# remove num from array
# return new array
# each over new array
# add num to new_num
# if == target celebrate

# Find the correct integers (addens)
# return a new array of the two addens
# each over new array to find indices