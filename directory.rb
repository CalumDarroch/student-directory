def input_students
  puts "Please enter the names and cohorts of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  months = ["january", "february", "march", "april", "may", "june", "july",
  "august", "september", "october", "november", "december", "tbc"]
  # get the first name
  name = gets.chomp
  cohort = gets.chomp
  # while the name and cohort are not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    if cohort.empty?
      cohort = "TBC"
    end
    
    while true do
      if months.include? cohort.downcase
        students << {name: name, cohort: cohort}
        puts "Now we have #{students.count} students"
        break
      else
        puts "Did you make a mistake when typing the cohort?"
        cohort = gets.chomp
      end
    end
    
    # get another name from the user
    name = gets.chomp
    cohort = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  while true do
    puts "Which cohort would you like to print?"
    print_cohort = gets.chomp.downcase
    
    filtered_students = students.select { |student| student[:cohort] == print_cohort}
    
    filtered_students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end  
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)