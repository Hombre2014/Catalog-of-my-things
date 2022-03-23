require './helpers'
require_relative 'book'



class UserInput
  include Helpers

  def initialize
    @books = load_books
    #@retrieve_data = RetrieveData.new(@books, @games)
  end
  def list_of_options(choice)
    case choice
    when 1 then list_books
    when 2 then list_music_albums
    when 3 then list_games
    when 4 then list_genres
    when 5 then list_labels
    when 6 then list_authors
    when 7 then add_book
    when 8 then add_music_album
    when 9 then add_game
    when 10 then exit_app
    end
  end

  
  def list_books
    puts 'There are no books in the catalog' if @books.empty?
    @books.each do |book|
      puts "Publish Data: #{book['publish_date']}, cover_state:#{book['cover_state']} , publisher: #{book['publisher']}"
    end
  end

  def add_book
    puts 'Enter the publisher of the book'
    publisher = gets.chomp
    puts 'Enter the cover state of the book'
    cover_state = gets.chomp
    print 'Date of publish [Enter date in format (yyyy-mm-dd)]: '
    publish_date = gets.chomp
    return unless publish_date
    @books.push(Book.new(publisher, cover_state, publish_date))
  end


end
  
