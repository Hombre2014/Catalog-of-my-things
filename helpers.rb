require_relative 'book'
require_relative 'game'
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


  def list_games
    games = JSON.parse(File.read('games.json'))
    if games.empty?
      puts 'No game in Catalog yet. Please add game from menu!'
    else
      games.each do |game|
        puts "Multiplayer: #{game['multiplayer']}"
        puts "Last played at: #{game['last_played_at']}"
        puts "Publication date: #{game['pub_date']}"
        puts "Archived: #{game['archived']}"
      end
    end
  end

  def create_music_album_obj(music_album)
    { name: music_album.name, publish_date: music_album.publish_date, on_spotify: music_album.on_spotify }
  end

  def create_genre_obj(genre)
    { name: genre.name }
  end

  def add_game
    print 'Is the game multiplayer: '
    multiplayer = gets.chomp
    print 'When was it last played [YYYY/MM/DD]: '
    last_played = gets.chomp
    print 'What is the publish date of the game: '
    pub_date = gets.chomp
    game = Game.new(multiplayer, last_played, pub_date)
    File.write('games.json', JSON.generate([])) unless File.exist? 'games.json'
    games = JSON.parse(File.read('games.json'))
    games << { 'multiplayer' => game.multiplayer, 'last_played_at' => game.last_played_at,
               'pub_date' => game.publish_date }
    File.write('games.json', JSON.generate(games))
    puts 'Game added successfully!'
  end
end
