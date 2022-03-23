require_relative 'user_input'

class Main
  def initialize
    @user_input = UserInput.new
  end

  def start
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
    puts '10. Exit'
    print "\nEnter a number: "
  end
  def run
    puts 'Welcome to catalog of my things app!'
    loop do
      start
      choice = gets.chomp.to_i
      break if choice == 10
      user_input = UserInput.new
      user_input.list_of_options(choice)
    end
    @user_input.exit_app

    print 'Thank you for using catalog of my things app!'
  end
end

  main = Main.new
  main.run
