require 'json'
require 'date'
require_relative 'music_album'
require_relative 'genre'
require_relative 'label'

class AddMusicAlbum
  def initialize(music_albums, genres)
    @music_albums = music_albums
    @genres = genres
  end

  def add
    puts "\Add a new music album"
    print "\nEnter music album's name: "
    name = gets.chomp
    print "Enter album's published date [yyyy-mm-dd]: "
    publish_date = Date.parse(gets.chomp)
    print 'Is the album on Spotify (y/n): '
    on_spotify = gets.chomp.downcase == 'y' || false
    @music_albums.push(MusicAlbum.new(name, publish_date, on_spotify))
    puts "Music album #{name} added successfully.\n"
    print "\nDo you want to add a genre? Please enter [Y/N]: "
    answer = gets.chomp.downcase == 'y' || false
    if answer
      print "\nPlease, enter the genre name: "
      genre_name = gets.chomp
      @genres << Genre.new(genre_name)
      puts "\nGenre #{genre_name} added successfully.\n"
    else
      puts 'No genre added.'
    end
  end
end

class ListMusicAlbums
  def initialize(music_albums, genres)
    @music_albums = music_albums
    @genres = genres
  end

  def display
    puts "\nList of all the music albums:"
    @music_albums.each do |album|
      puts "\nMusic album's name: #{album.name}"
      puts "Publish Date: #{album.publish_date}"
      puts "On Spotify: #{album.on_spotify}"
    end
  end
end

class ListGenres
  def initialize(genres)
    @genres = genres
  end

  def display
    puts "\nList of all the genres:"
    @genres.each do |genre|
      puts "\nGenre's name: #{genre.name}"
    end
  end
end

class ListBooks
  def initialize(books, labels)
    @books = books
    @labels = labels
  end

  def display
    puts "\nList of all the books:"
    @books.each do |book|
      puts "\nBook publisher: #{book.publisher}"
      puts "Publish Date: #{book.publish_date}"
      puts "Cover state: #{book.cover_state}"
    end
  end

  def add
    puts 'Enter the publisher of the book'
    publisher = gets.chomp
    puts 'Enter the cover state of the book'
    cover_state = gets.chomp
    print 'Date of publish [Enter date in format (yyyy-mm-dd)]: '
    publish_date = gets.chomp
    print 'Do you Want to add a label? Please enter [Y/N]: '
    answer = gets.chomp.downcase == 'y' || false
    if answer
      print 'Enter the label name: '
      label_name = gets.chomp
      print 'Enter the label Color: '
      label_color = gets.chomp
      @labels << Label.new(label_name, label_color)
      puts "\nLabel #{label_name} added successfully.\n"
    else
      puts 'No label added.'
    end
    @books << Book.new(publisher, cover_state, publish_date)
  end

  def save
    puts 'Books succesfuly saved'
    book_arr = []
    @books.each do |book|
      book_arr.push({ publisher: book.publisher, cover_state: book.cover_state, publish_date: book.publish_date })
    end
    File.open('books.json', 'w') { |f| f << JSON.generate(book_arr) }

    if @labels.empty?
      puts 'No label added'
    else
      label_arr = []
      @labels.map do |labela|
        label_arr.push({ label_name: labela.title, label_color: labela.color })
      end
      File.open('labels.json', 'w') { |f| f << JSON.generate(label_arr) }
    end
  end
end

class ListLabel
  def initialize(labels)
    @labels = labels
  end

  def display
    puts "\nList of all the labels:"
    @labels.each do |labela|
      puts "\nLabel's name: #{labela.title} and color: #{labela.color}"
    end
  end
end
