require_relative 'helpers'

class UserInput
  def initialize(choice)
    @choice = choice
  end

  case @choice
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
