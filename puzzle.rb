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

array = generate_puzzle
puts array.inspect
print_square(array)
