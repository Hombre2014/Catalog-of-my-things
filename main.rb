require_relative 'user_input'
require_relative 'helpers'
require_relative 'load_data'

class Main
  include Helpers
  def initialize
    @load_data = LoadData.new(@music_albums, @genres, @books, @labels)
    @music_albums = @load_data.load_music_albums
    @genres = @load_data.load_genres
    @books = @load_data.load_books
    @labels = @load_data.load_labels
  end

  def start
    puts "\nWelcome to catalog of my things app!"
    puts "\nPlease, choose an option from the menu below.\n"
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
    choice = gets.chomp.to_i
    user_input = UserInput.new(choice, @music_albums, @genres, @books, @labels)
    user_input.input(choice)
    start
  end
end

main = Main.new
main.start
