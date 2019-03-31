require 'csv'

@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  @name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !@name.empty? do
    # add the student hash to the array
    add_students
    puts "Now we have #{@students.count} students"
    # get another name from the user
    @name = STDIN.gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students"
  puts "4. Load the list of students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      puts "What file do you want to save to?"
      save_students(filename = STDIN.gets.chomp)
    when "4"
      puts "What file do you want to load from?"
      load_students(filename = STDIN.gets.chomp)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def save_students(filename)
  # open the file for writing
  CSV.open(filename, "w") do |csv|
  # iterate over the array of students
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
  puts "Students saved to #{filename}"
end

def load_students(filename = "students.csv")
while true do
  if !File.exists?(filename)
    puts "I couldn't find that file, please try again"
    filename = gets.chomp
  else
    CSV.foreach(filename) do |line|
      @name, @cohort = line
      add_students
    end
    break
  end
end
  puts "Loaded students from #{filename}"
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?  # if no filename input in command line
    load_students() # runs load_students, which defaults to students.csv
  elsif File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def add_students
  @students << {name: @name, cohort: (@cohort = :november).to_sym}
end

try_load_students
interactive_menu