require_relative 'user_input'

class Main
  def initialize
    
  end

  def start
    puts 'Welcome to catalog of my things app!'
    puts 'Please, choose an option from the menu below.'
    puts '1. List all of my books'
    puts '2. List all of my music albums'
    puts '3. List all of my games'
    puts '4. List all genres'
    puts '5. List all labels'
    puts '6. List all authors'
    puts '7. Add a new book'
    puts '8. Add a new music album'
    puts '9. Add a new game'
    puts '10. Add a new game'
    print "\nEnter a number: "
    choice = gets.chomp.to_i
    user_input = UserInput.new(choice)
  end
end

main = Main.new
main.start