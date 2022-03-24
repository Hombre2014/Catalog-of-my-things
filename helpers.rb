require_relative 'book'
require_relative 'music_album'
require_relative 'genre'
require 'json'

module Helpers
  def file_open(filename)
    if File.exist?(filename)
      file = File.open(filename)
      file_data = file.read
      JSON.parse(file_data.to_json)
    else
      []
    end
  end

  def read_file(filename)
    case filename
    when 'books.json' then file_open(filename)
    when 'music_albums.json' then load_music_albums(file_open(filename))
    when 'genres.json' then load_genres(file_open(filename))
    when 'labels.json' then load_labels(file_open(filename))
    end
  end

  def save_file(filename, json)
    file = File.new(filename, 'w')
    file.puts(json)
    file.close
  end

  def list_games
    games = JSON.parse(File.read('games.json'))
    if games.empty?
      puts 'No game in Catalog yet. Please add game from menu!'
    else
      games.each do |game|
        puts "Multiplayer: #{game['multiplayer']}"
        puts "Last played at: #{game['last_played_at']}"
        puts "Publication date: #{game['pub_date']}"
      end
    end
  end

  def create_music_album_obj(music_album)
    { name: music_album.name, publish_date: music_album.publish_date, on_spotify: music_album.on_spotify }
  end

  def create_genre_obj(genre)
    { name: genre.name }
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
      data.push({ publisher: book.publisher, cover_state: book.cover_state })
    end
    save_file('books.json', JSON.generate(data))
  end
end
