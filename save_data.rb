require 'json'

class SaveData
  include Helpers

  def initialize(music_albums, genres)
    @music_albums = music_albums
    @genres = genres
  end

  def save
    music_album_obj = @music_albums.map do |music_album|
      create_music_album_obj(music_album)
    end
    music_albums_json = JSON.generate(music_album_obj)

    genre_obj = @genres.map do |genre|
      create_genre_obj(genre)
    end
    genres_json = JSON.generate(genre_obj)

    save_file('music_albums.json', music_albums_json)
    save_file('genres.json', genres_json)
  end
end
