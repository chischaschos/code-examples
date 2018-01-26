# creating a variable that that stores the file name we pass
input_file = ARGV.first
# this method is printing the open file
def print_all(f)
  puts f.read
end
# this method is using the rewind method which goes back to the begning of the file
def rewind(f)
  f.seek(0)
end
# this method uses the
def print_a_line(line_count, f)
  puts "#{line_count}, #{f.gets.chomp}"
end

current_file = open(input_file)

puts "First let's print the whole file:\n"

print_all(current_file)

puts "Now let's rewind, kind of like a tape."

rewind(current_file)

puts "Let's print three lines:"

current_line = 1
print_a_line(current_line, current_file)

# current_line = current_line + 1
print_a_line(current_line, current_file)

# current_line = current_line + 1
print_a_line(current_line, current_file)
