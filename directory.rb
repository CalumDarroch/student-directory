def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.delete "\n"
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
      if students.length == 1
        puts "Now we have #{students.count} student"
      else
        puts "Now we have #{students.count} students"
      end
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header(students)
  if students.length == 0
    return nil
  else    
    puts "The students of Villains Academy"
    puts "-------------"
  end
end

def print(students)
  if students.length == 0
    puts "There are no students enrolled."
  else    
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  if students.length == 0
    return nil
  else
    puts "Overall, we have #{students.count} great students"
  end
end

students = input_students
#nothing happens until we call the methods
print_header(students)
print(students)
print_footer(students)