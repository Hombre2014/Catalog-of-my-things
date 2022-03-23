require_relative 'game'
require 'json'

module GameUtils
  def add_game
    print 'Is the game multiplayer: '
    multiplayer = gets.chomp
    print 'When was it last played [YYYY/MM/DD]: '
    last_played = gets.chomp
    print 'What is the publish date of the game: '
    pub_date = gets.chomp
    print 'Do you want to add an author? [y] for yes and [n] for no: '
    author = gets.chomp
    case author
    when 'y' then add_author
    when 'n' then ''
    end
    game = Game.new(multiplayer, last_played, pub_date)
    File.write('games.json', JSON.generate([])) unless File.exist? 'games.json'
    games = JSON.parse(File.read('games.json'))
    games << { 'multiplayer' => game.multiplayer, 'last_played_at' => game.last_played_at,
               'pub_date' => game.publish_date }
    File.write('games.json', JSON.generate(games))
    puts "\nGame added successfully!"
  end

  def list_games
    games = JSON.parse(File.read('games.json'))
    if games.empty?
      puts 'No game in Catalog yet. Please add game from menu!'
    else
      puts "\nList of all the games"
      puts ''
      games.each do |game|
        puts "Multiplayer: #{game['multiplayer']}"
        puts "Last played at: #{game['last_played_at']}"
        puts "Publication date: #{game['pub_date']}"
        puts ''
      end
    end
  end
end
