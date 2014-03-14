require 'pry'
require './lib/term'

def dictionary_ui
  dictionary = Term.all

  puts "What do you want?\nType 'a' to add a new word to the dictionary\nType 'e' to edit a word in the dictionary\nType 'd' to display current word in dictionary\nType 's' to search for  word\nPut 'x' to exit "
  case choice = gets.chomp

    when 'a'
      add_term_menu
    when 'e'
      edit_term_menu
    when 'd'
      display_words_menu
    when 's'
      search_words_menu
    when 'x'
      puts "Goodbye"
  else
    system('clear')
    puts "Invalid Input"
    dictionary_ui
  end
end

def add_term_menu
  puts "Enter new word."
  entered_word = gets.chomp
  puts "Enter definition for #{entered_word}"
  entered_definition = gets.chomp
  Term.create(entered_word, entered_definition)
  system('clear')
  puts "#{entered_word} has been entered to the dictionary"
  dictionary_ui
end

def edit_term_menu
  system('clear')
  dictionary = Term.all
  puts "Give the number corresponding to the word you want to edit."
  puts puts_dictionary(dictionary)
  edit_word_index = gets.chomp.to_i
  if edit_word_index < 0 || edit_word_index >= dictionary.length
    system('clear')
    puts "Invalid input. Try again"
    edit_term_menu
  else
    term_obj = dictionary[edit_word_index]
    puts "Type 'a' to Add a definition
    \nType 'e' to Edit a definitions
    \nType 'd' to Delete a definition"
    case def_choice = gets.chomp
    when 'a'
      puts "Add your new definition"
      Term.all[edit_word_index].add_new_definition(gets.chomp)
      puts "New definition added: "
      dictionary_ui
    when 'e'
      puts "Choose number correlating to definition you want to edit"
      Term.all[edit_word_index].definitions.each_with_index do |d, index|
        puts "#{index}: #{d.definition}"
      end
      term_index = gets.chomp
      term_to_edit = Term.all[edit_word_index]
      Term.all[edit_word_index].add_new_definition(gets.chomp)
      dictionary_ui
    when 'd'
      puts "Choose number correlating to the definition you want to delete"
      Term.all[edit_word_index].definitions.each_with_index do |d, index|
        puts "#{index}: #{d.definition}"
      end
      Term.all[edit_word_index].definitions.delete(gets.chomp)
      dictionary_ui
    end
  end
end

def display_words_menu
  system('clear')
  puts "Here are your curent dictionary words"
  dictionary = Term.all
  puts_dictionary(dictionary)
  dictionary_ui
end

def search_words_menu
  system('clear')
  puts "Enter the word you would like to search for"
  search_word = gets.chomp
  dictionary = Term.all
  term_obj = Term.search(search_word)
  if !term_obj
    puts "Your word was not found in the dictionary"
  else
    puts "Here is your word: #{term_obj.word} #{term_obj.definition}
    \nNow what do you want to do?
    \nType 'a' for Add a definition
    \nType 'e' to edit a definition"
    case choice = gets.chomp
      when 'a'
      add_definition
      when 'e'
        edit_definition
      else
        system('clear')
        dictionary_ui
    end
  end
end

def puts_dictionary(dictionary)
  dictionary.each_with_index do |entry, index|
    puts "[#{index}] #{dictionary[index].description}:"
    dictionary[index].definitions.each do |d|
      puts "\t#{d.definition}"
    end
    #{dictionary[index].definition}"
  end
  puts "\n\n"
end


dictionary_ui
# @words = []

# def main_menu
#   system('clear')
#   puts "Press 'a' to add a word or 'l' to list all of your tasks."
#   puts "Press 'x' to exit."
#   main_choice = gets.chomp
#   if main_choice == 'a'
#     add_word
#   elsif main_choice == 'l'
#     list_words
#   elsif main_choice == 'x'
#     puts "Good-bye!"
#   else
#     puts "Sorry, that wasn't a valid option."
#     main_menu
#   end
# end

# def add_word
#   system('clear')
#   puts "Enter new word:"
#   word1 = gets.chomp
#   puts "Enter a definition for your new word:"
#   definition1 = gets.chomp
#   @words << Term.create(word1, definition1)
#   puts "Word added.\n\n"
#   main_menu
# end

# def list_words
#   system('clear')
#   puts "Here are all of your words:"
#   @words.each do |word|
#     puts word.description
#   end
#   puts "\n"
#   main_menu
# end

# main_menu
