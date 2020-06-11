# 10 Little Monkeys exercise

def number_words 
  { 10 => 'Ten', 9 => 'Nine', 8 => 'Eight', 7 => 'Seven', 6 => 'Six', 5 => 'Five', 4 => 'Four', 3 => 'Three', 2 => 'Two', 1 => 'One' }
end

def doc(number)
  number > 1 ? 'No more monkeys jumping on the bed!' : 'Get those monkeys right to bed!'
end

def end_s(number)
  's' if number > 1
end

def mainstring(number)
  "#{number_words[number]} little monkey#{end_s(number)} jumping on the bed,\nOne fell off and bumped his head,\nMama called the doctor and the doctor said,"
end

10.times do |index|
  number = 10 - index
  puts mainstring(number)
  puts doc(number)
  puts ''
end