require_relative 'book'

module Helpers
  def file_open(filename)
    if File.exist?(filename)
      file = File.open(filename)
      file_data = file.read
      JSON.parse(file_data)
    else
      []
    end
  end

  def read_file(filename)
    case filename
    when 'books.json' then load_books(file_open(filename))
    when 'music_albums.json' then load_music_albums(file_open(filename))
    when 'games.json' then load_games(file_open(filename))
    when 'ganres.json' then load_genres(file_open(filename))
    when 'labels.json' then load_labels(file_open(filename))
    when 'authors.json' then load_authors(file_open(filename))
    end
  end

  def save_file(filename, json)
    file = File.new(filename, 'w')
    file.puts(json)
    file.close
  end

  def list_books
    books = read_file('books.json');
    puts 'There are no books in the catalog' if books.empty?

    @books.each do |book|
      puts "Publish Data: #{book.publish_date}, cover_state:#{book.cover_state}"
    end
  end

  def list_music_albums
    
  end

  def list_games
    
  end

  def list_genres
    
  end

  def list_labels
    
  end

  def list_authors
    
  end

  def add_book
    puts 'Enter the publisher of the book'
    publisher = gets.chomp
    puts 'Enter the cover state of the book'
    cover_state = gets.chomp
    @books << Book.new(publisher, cover_state)
  end

  def add_music_album
    
  end

  def add_game
    
  end

  def exit_app
    save_books()
    puts "Successfully exit app"
  end

  def load_games
    json = File.read('games.json')
    if json.empty?
      []
    else
      parsed_json = JSON.parse(json)
      parsed_json.map do |game|
        new_game = Game.new(game['multiplayer'], game['last_played_at'], game['published_date'], game['_archived'])
        new_game
      end
    end
  end

  def load_books
    data = []
    @books.each do |book|
      data.push(Book.new(book['publisher'], book['cover_state']))
    end
    data
  end
  def save_books
    data = []
    @books.each do |book|
      data.push({'publisher':book.publisher, 'cover_state': book.cover_state}) 
    end
    save_file('books.json', JSON.generate(data))
  end
end
