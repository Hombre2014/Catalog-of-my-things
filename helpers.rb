require_relative 'book'
require_relative 'music_album'
require_relative 'genre'
require 'json'

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
    when 'genres.json' then load_genres(file_open(filename))
    when 'labels.json' then load_labels(file_open(filename))
    when 'authors.json' then load_authors(file_open(filename))
    end
  end

  def save_file(filename, json)
    file = File.new(filename, 'w')
    file.puts(json)
    file.close
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
