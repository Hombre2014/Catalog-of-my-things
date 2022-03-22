require_relative 'helpers'
require_relative 'action'
require_relative 'save_data'

class UserInput
  include Helpers

#   def compute_choice(choice)
#     case choice
#     when '1' then list_books
#     when 2 then list_music_albums
#     when 3 then list_games
#     when 4 then list_genres
#     when 5 then list_labels
#     when 6 then list_authors
#     when 7 then add_book
#     when 8 then add_music_album
#     when 9 then add_game
#     when 10 then exit_app
#     end
#   end
  
  def initialize(choice, music_albums, genres)
    @choice = choice
    @music_albums = music_albums
    @genres = genres
    @list_genres = ListGenres.new(genres)
    @list_music_albums = ListMusicAlbums.new(music_albums, genres)
    @add_music_album = AddMusicAlbum.new(music_albums, genres)
    @save_data = SaveData.new(@music_albums, @genres)
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def input(choice)
    @choice = choice
    case @choice
    when 1 then list_books
    when 2 then @list_music_albums.display
    when 3 then list_games
    when 4 then @list_genres.display
    when 5 then list_labels
    when 6 then list_authors
    when 7 then add_book
    when 8 then @add_music_album.add
    when 9 then add_game
    when 10
      @save_data.save
      puts "\nThank you for using Catalog of my things app. Goodbye!"
      exit
    else
      puts "\nPlease, enter a valid number between 1 and 10.\n"
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
