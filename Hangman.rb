def draw_man(numberofbodyparts)
  if numberofbodyparts == 0
    puts ""
  elsif numberofbodyparts == 1
    puts '____________
|      |
|
|
|
|
-----------'
  elsif numberofbodyparts == 2
    puts '____________
|      |
|      0
|
|
|
-----------'
  elsif numberofbodyparts == 3
    puts '____________
|      |
|      0
|      |
|
|
-----------'
  elsif numberofbodyparts == 4
    puts '____________
|      |
|      0
|     /|
|
|
-----------'
  elsif numberofbodyparts == 5
    puts '____________
|      |
|      0
|     /|\
|
|
-----------'
  elsif numberofbodyparts == 6
    puts '____________
|      |
|      0
|     /|\
|      |
|
-----------'
  elsif numberofbodyparts == 7
    puts '____________
|      |
|      0
|     /|\
|      |
|     /
-----------'
  elsif numberofbodyparts == 8
    puts '____________
|      |
|      0
|     /|\
|      |
|     / \
-----------'
  end
end

f = File.new("./dictionary.txt", "r")
words = f.read.chomp
f.close

random_word = words.split("\n")
random_word = random_word.sample.chomp
secret_word_array = random_word.split('')
numberofbodyparts = 0

draw_man(0)

letters_guessed = [].sort
def display_guess_progress(secret_word_array, letters_guessed)
  secret_word_array.each do |x|
    if (letters_guessed.include? x) ==true
      print x
    elsif (letters_guessed.include? x) ==false
      print " _ "
    end
  end
  puts ""
  puts ""
  puts "Letters already guessed:"
  puts letters_guessed.sort.join(',')
end

while numberofbodyparts <= 8
  puts "Guess a letter"
  letter = gets.chomp
  letters_guessed.push(letter)
  if (secret_word_array.include? letter) == false
    numberofbodyparts = numberofbodyparts + 1
  end
  draw_man(numberofbodyparts)
  display_guess_progress(secret_word_array, letters_guessed)
  if numberofbodyparts == 8
    puts "You lose!"
    puts "The correct word was #{random_word}"
    exit
  end
end