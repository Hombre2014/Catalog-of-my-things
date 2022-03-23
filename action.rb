require 'json'
require 'date'
require_relative 'music_album'
require_relative 'genre'

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