class LoadData
  def initialize(music_albums, genres)
    @music_albums = music_albums
    @genres = genres
  end

  def load_music_albums
    json = File.read('music_albums.json')
    if json.empty?
      []
    else
      parsed_json = JSON.parse(json)
      parsed_json.map do |music_album|
        new_music_album = MusicAlbum.new(music_album['name'], music_album['publish_date'], music_album['on_spotify'])
        new_music_album
      end
    end
  end

  def load_genres
    json = File.read('genres.json')
    if json.empty?
      []
    else
      parsed_json = JSON.parse(json)
      parsed_json.map do |genre|
        new_genre = Genre.new(genre['name'])
        new_genre
      end
    end
  end
end
