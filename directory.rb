def input_students
  puts "Please enter the names of the students, followed by their country of
  origin, height and favourite hobby"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  country = gets.chomp
  height = gets.chomp
  hobby = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, country: country, height: height, hobby: hobby,
    cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
    country = gets.chomp
    height = gets.chomp
    hobby = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]}, #{student[:country]}, #{student[:height]},
    #{student[:hobby]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
# Nothing happens until we call the methods
print_header
print(students)
print_footer(students)