require 'io/console'

#1) Generate the vector Game, puts the result
def generate_puzzle
  array = [1,2,3,4,5,6,7,8," "].shuffle
end

def print_square(array)
  puts"
   _ _ _ _ _ _ _ _ _ _ _
  |      |       |      |
  |  #{array[0]}   |   #{array[1]}   |  #{array[2]}   |
  |_ _ _ |_ _ _ _| _ _ _|
  |      |       |      |
  |  #{array[3]}   |   #{array[4]}   |  #{array[5]}   |
  |_ _ _ |_ _ _ _| _ _ _|
  |      |       |      |
  |  #{array[6]}   |   #{array[7]}   |  #{array[8]}   |
  |_ _ _ |_ _ _ _| _ _ _|
  "
end

# Reads keypresses from the user including 2 and 3 escape character sequences.
def read_char
  STDIN.echo = false
  STDIN.raw!

  input = STDIN.getc.chr
  if input == "\e" then
    input << STDIN.read_nonblock(3) rescue nil
    input << STDIN.read_nonblock(2) rescue nil
  end
ensure
  STDIN.echo = true
  STDIN.cooked!

  return input
end

# oringal case statement from:
# http://www.alecjacobson.com/weblog/?p=75

def manage_key(array)
  c = read_char
  case c
  when "\e[A"
    up(array)
    puts "UP ARROW"
  when "\e[B"
    puts "DOWN ARROW"
    down(array)
  when "\e[C"
    puts "RIGHT ARROW"
    right(array)
  when "\e[D"
    puts "LEFT ARROW"
    left(array)
  when "\u0003"
    puts "CONTROL-C"
    exit 0
  end
end

#4) Movements
def right(array)
  index = array.index(" ")
  array[index - 8], array[index] = array[index], array[index -8]
  print_square(array)
end

def left(array)
  index = array.index(" ")
  array[index - 1], array[index] = array[index], array[index - 1]
  print_square(array)
end

def up(array)
  index = array.index(" ")
  array[index - 3], array[index] = array[index], array[index - 3]
  print_square(array)
end

def down(array)
  index = array.index(" ")
  array[index - 6], array[index] = array[index], array[index - 6]
  print_square(array)
end
array = generate_puzzle
manage_key(array) while(true)
