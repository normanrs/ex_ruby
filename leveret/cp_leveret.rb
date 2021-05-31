TEST_ARRAYS = [[4, 5, 3, 5], [7, 1, 1, 1, 1, 1], [10, 1, 1], [12, 2]]


def rows_eaten(plot_array)
  count = 0
  total = 0
  plots = []
  while total < 10
    total += plot_array[count]
    plots << plot_array[count]
    count += 1 unless total > 10
  end
  puts "Leveret eats #{count} plots from #{plot_array}"
  return count
end

TEST_ARRAYS.each do |test_array|
  rows_eaten(test_array)
end
