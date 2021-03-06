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
    puts "\nAdd a new music album"
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
    if @music_albums.length.zero?
      puts "\nThere are no music albums in the catalog. You can add one from the menu."
    else
      puts "\nList of all the music albums:"
      @music_albums.each do |album|
        puts "\nMusic album's name: #{album.name}"
        puts "Publish Date: #{album.publish_date}"
        puts "On Spotify: #{album.on_spotify}"
      end
    end
  end
end

class ListGenres
  def initialize(genres)
    @genres = genres
  end

  def display
    if @genres.length.zero?
      puts "\nThere are no genres in the catalog. You can add one when you add music albums."
    else
      puts "\nList of all the genres:"
      @genres.each do |genre|
        puts "\nGenre's name: #{genre.name}"
      end
    end
  end
end

class ListBooks
  def initialize(books, labels)
    @books = books
    @labels = labels
  end

  def display
    if @books.length.zero?
      puts "\nThere are no books in the catalog. You can add one from the menu."
    else
      puts "\nList of all the books:"
      @books.each do |book|
        puts "\nBook publisher: #{book.publisher}"
        puts "Publish Date: #{book.publish_date}"
        puts "Cover state: #{book.cover_state}"
      end
    end
  end

  def add
    print "\nEnter the publisher of the book: "
    publisher = gets.chomp
    print "\nEnter the cover state of the book: "
    cover_state = gets.chomp
    print "\nDate of publish [Enter date in format (yyyy-mm-dd)]: "
    publish_date = gets.chomp
    print "\nDo you Want to add a label? Please enter [Y/N]: "
    answer = gets.chomp.downcase == 'y' || false
    if answer
      print "\nEnter the label name: "
      title = gets.chomp
      print "\nEnter the label color: "
      color = gets.chomp
      @labels << Label.new(title, color)
      puts "\nLabel #{title} added successfully.\n"
    else
      puts 'No label added.'
    end
    @books << Book.new(publisher, cover_state, publish_date)
    puts 'Book added successfully.'
  end

  def save
    book_arr = []
    @books.each do |book|
      book_arr.push({ publisher: book.publisher, cover_state: book.cover_state, publish_date: book.publish_date })
    end
    File.open('books.json', 'w') { |f| f << JSON.generate(book_arr) }
  end
end

class ListLabel
  def initialize(labels)
    @labels = labels
  end

  def display
    if @labels.length.zero?
      puts "\nThere are no labels in the catalog. You can add one when you add books."
    else
      puts "\nList of all the labels:"
      @labels.each do |labela|
        puts "\nLabel's name: #{labela.title} and color: #{labela.color}"
      end
    end
  end

  def save
    label_arr = []
    @labels.each do |label|
      label_arr.push({ title: label.title, color: label.color })
    end
    File.open('labels.json', 'w') { |f| f << JSON.generate(label_arr) }
  end
end
